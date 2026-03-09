:- module(liturgical, [date/9]).

:- multifile date/9.
:- discontiguous date/9.

:- ensure_loaded(advent).
:- ensure_loaded(christmas).
:- ensure_loaded(easter).
:- ensure_loaded(epiphany).
:- ensure_loaded(lent).
:- ensure_loaded(ordinary).
:- ensure_loaded(pentecost).
:- ensure_loaded(static).
:- ensure_loaded(transfer).

:- ensure_loaded(catchall).