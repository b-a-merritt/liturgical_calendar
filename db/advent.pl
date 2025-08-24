:- use_module(util).

first_sunday_advent(Year, Month, Day) :-
    next_sunday(Year, Prevsundaymonth, Prevsundayday, Year, 12, 25),
    weeks_after(Year, Prevsundaymonth, Prevsundayday, -4, _, Month, Day).