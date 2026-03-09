:- module(advent, [first_sunday_advent/3]).

:- use_module(util).
:- use_module(constants).
:- multifile liturgical:date_internal/8.

first_sunday_advent(Year, Month, Day) :-
    next_sunday(Year, 12, 17, Y4, M4, D4),
    weeks_after(Y4, M4, D4, -3, _, Month, Day).

liturgical:date_internal(ID, Year, Month, Day, false, false, false, false) :-
    constants:first_sunday_advent(ID),
    first_sunday_advent(Year, Month, Day),
    !.

liturgical:date_internal(ID, Year, Month, Day, false, false, false, false) :-
    constants:second_sunday_advent(ID),
    first_sunday_advent(Year, M0, D0),
    weeks_after(Year, M0, D0, 1, _, Month, Day),
    !.

liturgical:date_internal(ID, Year, Month, Day, false, false, false, false) :-
    constants:third_sunday_advent(ID),
    first_sunday_advent(Year, M0, D0),
    weeks_after(Year, M0, D0, 2, _, Month, Day),
    !.

liturgical:date_internal(ID, Year, Month, Day, false, false, false, false) :-
    constants:fourth_sunday_advent(ID),
    first_sunday_advent(Year, M0, D0),
    weeks_after(Year, M0, D0, 3, _, Month, Day),
    !.
