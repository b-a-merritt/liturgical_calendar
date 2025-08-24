:- ensure_loaded(transfer).
:- ensure_loaded(util).

epiphany_date(Year, Month, Day) :-
    ( transferable('the_epiphany_of_the_lord', true)
    -> nearest_sunday(Year, 1, 6, Year, Month, Day)
    ;  Month = 1, Day = 6
    ).

date('the_epiphany_of_the_lord', 'The Epiphany of the Lord', Year, Month, Day, true, false, false, false) :-
    epiphany_date(Year, Month, Day).