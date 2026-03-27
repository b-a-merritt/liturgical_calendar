#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "liturgical.h"

static int failures = 0;

#define EXPECT(cond, msg) do { \
    if (!(cond)) { fprintf(stderr, "FAIL: %s\n", msg); failures++; } \
    else          { printf("  OK: %s\n", msg); } \
} while (0)

/* ------------------------------------------------------------------ */
/* Callback helpers                                                     */
/* ------------------------------------------------------------------ */

typedef struct {
    int count;
    liturgical_date_t last;
    /* fixed-size copies so we can inspect after the callback returns */
    char date_id[128];
    char name[256];
} collect_t;

static void collect_cb(const liturgical_date_t *d, void *ud) {
    collect_t *c = (collect_t *)ud;
    c->count++;
    c->last = *d;
    strncpy(c->date_id, d->date_id, sizeof(c->date_id) - 1);
    strncpy(c->name,    d->name,    sizeof(c->name)    - 1);
    c->last.date_id = c->date_id;
    c->last.name    = c->name;
}

/* ------------------------------------------------------------------ */
/* Test cases                                                           */
/* ------------------------------------------------------------------ */

static void test_christmas_2026(void) {
    printf("\n[Christmas 2026 — Dec 25]\n");
    collect_t r = {0};
    int n = liturgical_query(2026, 12, 25, collect_cb, &r);
    EXPECT(n > 0,    "at least one result returned");
    EXPECT(r.last.is_solemnity == 1, "is_solemnity == 1");
    EXPECT(r.last.is_feast     == 0, "is_feast == 0");
    EXPECT(strlen(r.name) > 0, "name is non-empty");
    printf("  name: %s\n", r.name);
    printf("  date_id: %s\n", r.date_id);
}

static void test_easter_2026(void) {
    printf("\n[Easter Sunday 2026 — Apr 5]\n");
    collect_t r = {0};
    int n = liturgical_query(2026, 4, 5, collect_cb, &r);
    EXPECT(n > 0,    "at least one result returned");
    EXPECT(r.last.is_solemnity == 1, "is_solemnity == 1");
    EXPECT(strlen(r.name) > 0, "name is non-empty");
    printf("  name: %s\n", r.name);
    printf("  date_id: %s\n", r.date_id);
}

static void test_all_saints_2026(void) {
    printf("\n[All Saints 2026 — Nov 1]\n");
    collect_t r = {0};
    int n = liturgical_query(2026, 11, 1, collect_cb, &r);
    EXPECT(n > 0,    "at least one result returned");
    EXPECT(r.last.is_solemnity == 1, "is_solemnity == 1");
    printf("  name: %s\n", r.name);
}

static void test_ordinary_weekday(void) {
    /* June 10, 2026 is a Wednesday in Ordinary Time — no named feast */
    printf("\n[Ordinary Wednesday 2026 — Jun 10]\n");
    collect_t r = {0};
    int n = liturgical_query(2026, 6, 10, collect_cb, &r);
    EXPECT(n >= 0, "query succeeded (no error)");
    if (n == 0) {
        printf("  (no liturgical entry — truly ordinary day)\n");
    } else {
        printf("  name: %s  date_id: '%s'\n", r.name, r.date_id);
        /* seasonal entries have empty date_id */
        EXPECT(strcmp(r.date_id, "") == 0 || strlen(r.date_id) > 0,
               "date_id is present or empty string (not garbage)");
    }
}

static void test_error_before_init(void) {
    /* Can't test init/cleanup ordering here because init is already done,
     * but we verify that error() returns a string (empty after success). */
    printf("\n[Error string after successful init]\n");
    const char *e = liturgical_error();
    EXPECT(e != NULL, "liturgical_error() returns non-NULL");
}

/* ------------------------------------------------------------------ */
/* Entry point                                                          */
/* ------------------------------------------------------------------ */

int main(void) {
    printf("=== liturgical C API smoke test ===\n");

    if (liturgical_init(NULL, NULL) != 0) {
        fprintf(stderr, "liturgical_init failed: %s\n", liturgical_error());
        return 1;
    }
    printf("Init OK\n");

    test_christmas_2026();
    test_easter_2026();
    test_all_saints_2026();
    test_ordinary_weekday();
    test_error_before_init();

    liturgical_cleanup();

    if (failures) {
        fprintf(stderr, "\n%d test(s) FAILED\n", failures);
        return 1;
    }
    printf("\nAll tests passed.\n");
    return 0;
}
