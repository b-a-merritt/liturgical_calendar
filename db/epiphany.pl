:- module(epiphany, [epiphany_date/3, baptism_date/3]).

:- use_module(transfer).
:- use_module(util).
:- multifile liturgical:date/9.

epiphany_date(Year, Month, Day) :-
    ( transferable('the_epiphany_of_the_lord', true)
    -> nearest_sunday(Year, 1, 6, Year, Month, Day)
    ;  Month = 1, Day = 6
    ).

baptism_date(Year, Month, Day) :-
    epiphany_date(Year, EpiphanyMonth, EpiphanyDay),
    next_sunday(Year, EpiphanyMonth, EpiphanyDay, _, Month, Day).

liturgical:date('the_epiphany_of_the_lord', 'The Epiphany of the Lord', Year, Month, Day, true, false, false, false) :-
    epiphany_date(Year, Month, Day),
    !.

liturgical:date('the_baptism_of_the_lord', 'The Baptism of the Lord', Year, Month, Day, false, false, false, false) :-
    baptism_date(Year, Month, Day),
    !.
