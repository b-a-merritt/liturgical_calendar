:- module(liturgical, [date/9]).

:- multifile date_internal/8.
:- discontiguous date_internal/8.

% Load constants first
:- use_module(constants).

% Load translations (default to English)
:- use_module('translations/en', [name/2]).

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

% Public API: date/9 with name resolved from translations
% date(DateId, Name, Year, Month, Day, IsSolemnity, IsFeast, IsOptionalMemorial, IsOptionalCommemoration)
date(DateId, Name, Year, Month, Day, IsSolemnity, IsFeast, IsOptionalMemorial, IsOptionalCommemoration) :-
    date_internal(DateId, Year, Month, Day, IsSolemnity, IsFeast, IsOptionalMemorial, IsOptionalCommemoration),
    en:name(DateId, Name).
