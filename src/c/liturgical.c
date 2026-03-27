#define _GNU_SOURCE  /* for dladdr on Linux */
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <limits.h>
#include <libgen.h>  /* dirname */
#include <dlfcn.h>   /* dladdr */

#include <SWI-Prolog.h>
#include "liturgical.h"

static int  g_initialized = 0;
static char g_error[1024] = "";

static void set_error(const char *fmt, ...) {
    va_list ap;
    va_start(ap, fmt);
    vsnprintf(g_error, sizeof(g_error), fmt, ap);
    va_end(ap);
}

/*
 * Resolve the directory that contains this shared library.
 * Used as an anchor for finding bundled Prolog files.
 */
static int so_directory(char *buf, size_t size) {
    Dl_info info;
    /* Cast function pointer to void* — POSIX extension, not ISO C, but
     * universally supported on Linux/macOS and required by dladdr's API. */
    if (dladdr((void *)liturgical_init, &info) && info.dli_fname && info.dli_fname[0]) {
        char tmp[PATH_MAX];
        strncpy(tmp, info.dli_fname, sizeof(tmp) - 1);
        tmp[sizeof(tmp) - 1] = '\0';
        const char *dir = dirname(tmp);
        strncpy(buf, dir, size - 1);
        buf[size - 1] = '\0';
        return 1;
    }
    return 0;
}

int liturgical_init(const char *prolog_home, const char *prolog_src) {
    if (g_initialized) return 0;

    char *argv[8];
    int   argc = 0;
    argv[argc++] = (char *)"liturgical";
    argv[argc++] = (char *)"--quiet";
    argv[argc++] = (char *)"--nosignals"; /* avoid signal handlers conflicting with host */

    char home_arg[PATH_MAX + 8];
    const char *home = prolog_home ? prolog_home : getenv("PLHOME");
    if (home) {
        snprintf(home_arg, sizeof(home_arg), "--home=%s", home);
        argv[argc++] = home_arg;
    }
    argv[argc] = NULL;

    if (!PL_initialise(argc, argv)) {
        set_error("PL_initialise failed (check PLHOME or pass prolog_home)");
        return -1;
    }

    char src_dir[PATH_MAX];
    const char *src = prolog_src ? prolog_src : getenv("LITURGICAL_SRC");

    if (src) {
        strncpy(src_dir, src, sizeof(src_dir) - 1);
        src_dir[sizeof(src_dir) - 1] = '\0';
    } else {
        /* Infer from the .so's own location: <so_dir>/../src/db
         * This works both in the build tree and in a bundle where the layout is:
         *   dist/lib/libliturgy.so
         *   dist/src/db/main.pl   */
        char so_dir[PATH_MAX - 16];  /* leave room for the suffix */
        if (!so_directory(so_dir, sizeof(so_dir))) {
            set_error("Cannot locate Prolog sources; set LITURGICAL_SRC env var");
            PL_cleanup(0);
            return -1;
        }
        snprintf(src_dir, sizeof(src_dir), "%s/../src/db", so_dir);
    }

    char main_path[PATH_MAX + 16];
    snprintf(main_path, sizeof(main_path), "%s/main", src_dir);

    predicate_t consult = PL_predicate("consult", 1, "user");
    term_t tpath = PL_new_term_refs(1);
    PL_put_atom_chars(tpath, main_path);

    if (!PL_call_predicate(NULL, PL_Q_NORMAL, consult, tpath)) {
        set_error("Failed to consult '%s' — check LITURGICAL_SRC", main_path);
        PL_cleanup(0);
        return -1;
    }

    g_initialized = 1;
    return 0;
}

int liturgical_query(int year, int month, int day,
                     liturgical_callback_t cb, void *user_data) {
    if (!g_initialized) {
        set_error("liturgical_init() has not been called");
        return -1;
    }

    predicate_t date_pred = PL_predicate("date", 9, "liturgical");
    if (!date_pred) {
        set_error("Predicate liturgical:date/9 not found");
        return -1;
    }

    /*
     * date(DateId, Name, Year, Month, Day,
     *      IsSolemnity, IsFeast, IsOptionalMemorial, IsOptionalCommemoration)
     *  index: 0       1     2     3      4
     *         5           6      7                   8
     */
    term_t args = PL_new_term_refs(9);
    /* Indices 0,1 and 5-8 remain unbound (output); bind Year/Month/Day */
    (void)PL_put_integer(args + 2, year);
    (void)PL_put_integer(args + 3, month);
    (void)PL_put_integer(args + 4, day);

    qid_t qid = PL_open_query(NULL, PL_Q_NORMAL, date_pred, args);
    if (!qid) {
        set_error("PL_open_query failed");
        return -1;
    }

    int count = 0;
    while (PL_next_solution(qid)) {
        liturgical_date_t result;
        result.year  = year;
        result.month = month;
        result.day   = day;

        /* DateId: unbound variable for seasonal/ordinary-time entries */
        char *s = NULL;
        if (PL_term_type(args + 0) == PL_VARIABLE) {
            result.date_id = "";
        } else {
            (void)PL_get_atom_chars(args + 0, &s);
            result.date_id = s ? s : "";
        }

        /* Name: may be an atom or a SWI-Prolog string type */
        char *name_s = NULL;
        (void)PL_get_chars(args + 1, &name_s, CVT_ATOM | CVT_STRING | BUF_RING);
        result.name = name_s ? name_s : "";

        /* Boolean rank flags — atoms true/false */
        int b = 0;
        (void)PL_get_bool(args + 5, &b); result.is_solemnity              = b;
        b = 0;
        (void)PL_get_bool(args + 6, &b); result.is_feast                  = b;
        b = 0;
        (void)PL_get_bool(args + 7, &b); result.is_optional_memorial      = b;
        b = 0;
        (void)PL_get_bool(args + 8, &b); result.is_optional_commemoration = b;

        if (cb) cb(&result, user_data);
        count++;
    }

    PL_close_query(qid);
    return count;
}

const char *liturgical_error(void) {
    return g_error;
}

void liturgical_cleanup(void) {
    if (g_initialized) {
        PL_cleanup(0);
        g_initialized = 0;
    }
}
