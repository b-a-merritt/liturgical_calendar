:- module(liturgical, [date/9]).

:- multifile date/9.
:- discontiguous date/9.

% Load all season/feast modules
:- use_module(advent).
:- use_module(christmas).
:- use_module(easter).
:- use_module(epiphany).
:- use_module(lent).
:- use_module(ordinary).
:- use_module(pentecost).
:- use_module(static).
:- use_module(transfer).

% Load catchall last (handles unmatched dates)
:- use_module(catchall).
