:- module(advent, [first_sunday_advent/3]).

:- use_module(util).
:- multifile liturgical:date/9.

first_sunday_advent(Year, Month, Day) :-
    next_sunday(Year, 12, 17, Y4, M4, D4),
    weeks_after(Y4, M4, D4, -3, _, Month, Day).

liturgical:date('first_sunday_advent', '1st Sunday of Advent', Year, Month, Day, false, false, false, false) :-
    first_sunday_advent(Year, Month, Day),
    !.

liturgical:date('second_sunday_advent', '2nd Sunday of Advent', Year, Month, Day, false, false, false, false) :-
    first_sunday_advent(Year, M0, D0),
    weeks_after(Year, M0, D0, 1, _, Month, Day),
    !.

liturgical:date('third_sunday_advent', '3rd Sunday of Advent (Gaudete)', Year, Month, Day, false, false, false, false) :-
    first_sunday_advent(Year, M0, D0),
    weeks_after(Year, M0, D0, 2, _, Month, Day),
    !.

liturgical:date('fourth_sunday_advent', '4th Sunday of Advent', Year, Month, Day, false, false, false, false) :-
    first_sunday_advent(Year, M0, D0),
    weeks_after(Year, M0, D0, 3, _, Month, Day),
    !.
