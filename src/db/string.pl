:- module(str, [
        christmas_name/2,
        season_name/4,
        epiphany_name/2,
        easter_octave_name/2,
        holy_week_name/2,
        christmas_octave_name/2
    ]).

:- use_module(library(strings)).


numeral(N, Ordinal) :-
    must_be(integer, N),
    suffix(N, Suf),
    format(atom(Ordinal), '~d~w', [N, Suf]).

suffix(N, 'th') :- N mod 100 >= 11, N mod 100 =< 13, !.
suffix(N, 'st') :- N mod 10 =:= 1, !.
suffix(N, 'nd') :- N mod 10 =:= 2, !.
suffix(N, 'rd') :- N mod 10 =:= 3, !.
suffix(_, 'th').


season_name(Weekday, Week, Season, Name) :-
    numeral(Week, Ordinal),
    format(string(Name), "~w in the ~w Week of ~w", [Weekday, Ordinal, Season]).

christmas_name(Weekday, Name) :-
    format(string(Name), "~w of Christmas Time", [Weekday]).

epiphany_name(Weekday, Name) :-
    format(string(Name), "~w after Epiphany", [Weekday]).

easter_octave_name(Weekday, Name) :-
    format(string(Name), "~w in the Octave of Easter", [Weekday]).

holy_week_name(Weekday, Name) :-
    format(string(Name), "~w of Holy Week", [Weekday]).

christmas_octave_name(Day, Name) :-
    numeral(Day, Ordinal),
    format(string(Name), "~w Day in the Octave of Christmas", [Ordinal]).