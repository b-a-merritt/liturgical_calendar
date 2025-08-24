:- use_module(util).

first_sunday_advent(Year, Month, Day) :-
    next_sunday(Year, 12, 17, _, M4, D4),  % 4th Sunday (earliest could be 18 December and latest 24 December)
    weeks_after(Year, M4, D4, -3, _, Month, Day).

date('first_sunday_advent', '1st Sunday of Advent', Year, Month, Day, false, false, false, false) :-
    first_sunday_advent(Year, Month, Day).

date('second_sunday_advent', '2nd Sunday of Advent', Year, Month, Day, false, false, false, false) :-
    first_sunday_advent(Year, M0, D0),
    weeks_after(Year, M0, D0, 1, _, Month, Day).

date('third_sunday_advent', '3rd Sunday of Advent (Gaudete)', Year, Month, Day, false, false, false, false) :-
    first_sunday_advent(Year, M0, D0),
    weeks_after(Year, M0, D0, 2, _, Month, Day).

date('fourth_sunday_advent', '4th Sunday of Advent', Year, Month, Day, false, false, false, false) :-
    first_sunday_advent(Year, M0, D0),
    weeks_after(Year, M0, D0, 3, _, Month, Day).
