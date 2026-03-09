:- module(ordinary, []).

:- use_module(advent).
:- use_module(string).
:- use_module(util).
:- multifile liturgical:date/9.

liturgical:date('our_lord_jesus_christ_king_of_the_universe', 'Our Lord Jesus Christ, King of the Universe', Year, Month, Day, true, false, false, false) :-
    first_sunday_advent(Year, M0, D0),
    weeks_after(Year, M0, D0, -1, _, Month, Day),
    !.
