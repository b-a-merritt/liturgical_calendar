#ifndef LITURGICAL_H
#define LITURGICAL_H

#ifdef __cplusplus
extern "C" {
#endif

/**
 * A single liturgical calendar result, corresponding to the Prolog predicate:
 *   date(DateId, Name, Year, Month, Day,
 *        IsSolemnity, IsFeast, IsOptionalMemorial, IsOptionalCommemoration)
 *
 * String pointers (date_id, name) are valid only for the duration of the
 * callback invocation. Copy them if you need them beyond that.
 */
typedef struct {
    const char *date_id;               /* identifier atom, e.g. "easter_sunday_of_the_lords_resurrection"
                                          "" for seasonal/ordinary-time entries (unbound in Prolog) */
    const char *name;                  /* human-readable name, e.g. "Easter Sunday" */
    int year, month, day;
    int is_solemnity;                  /* 1 if Solemnity, else 0 */
    int is_feast;                      /* 1 if Feast, else 0 */
    int is_optional_memorial;          /* 1 if Optional Memorial, else 0 */
    int is_optional_commemoration;     /* 1 if Optional Commemoration, else 0 */
} liturgical_date_t;

/**
 * Callback invoked once per result from liturgical_query().
 * @param date      Pointer to the result (valid only during this call)
 * @param user_data Opaque pointer passed through from liturgical_query()
 */
typedef void (*liturgical_callback_t)(const liturgical_date_t *date, void *user_data);

/**
 * Initialize the SWI-Prolog engine and load the liturgical calendar.
 * Must be called once before any liturgical_query() calls.
 *
 * @param prolog_home  Path to SWI-Prolog home directory (PLBASE), e.g.
 *                     "/usr/lib/swi-prolog" or a bundled copy.
 *                     Pass NULL to auto-detect via PLHOME env, then system default.
 * @param prolog_src   Path to the liturgical Prolog source directory (src/db/).
 *                     Pass NULL to auto-detect via LITURGICAL_SRC env, then a
 *                     path relative to the shared library's own location.
 * @return 0 on success, nonzero on failure (call liturgical_error() for details)
 */
int liturgical_init(const char *prolog_home, const char *prolog_src);

/**
 * Query all liturgical entries for a given calendar date.
 * Calls cb once per result in enumeration order.
 *
 * @param year, month, day  The date to query (month: 1–12, day: 1–31)
 * @param cb        Callback function; may be NULL (query still runs, count returned)
 * @param user_data Passed through to each cb invocation
 * @return Number of results (0 if no liturgical entry for the date), -1 on error
 */
int liturgical_query(int year, int month, int day,
                     liturgical_callback_t cb, void *user_data);

/**
 * Return the last error message, or "" if no error.
 * Valid until the next liturgical_* call.
 */
const char *liturgical_error(void);

/**
 * Shut down the SWI-Prolog engine.
 * After calling this, liturgical_init() may not be called again in the same process.
 */
void liturgical_cleanup(void);

#ifdef __cplusplus
}
#endif

#endif /* LITURGICAL_H */
