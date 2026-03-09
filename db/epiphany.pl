:- module(epiphany, [epiphany_date/3, baptism_date/3]).

:- use_module(transfer).
:- use_module(util).
:- use_module(constants).
:- multifile liturgical:date/9.

epiphany_date(Year, Month, Day) :-
    ( transferable('the_epiphany_of_the_lord', true)
    -> nearest_sunday(Year, 1, 6, Year, Month, Day)
    ;  Month = 1, Day = 6
    ).

baptism_date(Year, Month, Day) :-
    epiphany_date(Year, EpiphanyMonth, EpiphanyDay),
    next_sunday(Year, EpiphanyMonth, EpiphanyDay, _, Month, Day).

liturgical:date(ID,'The Epiphany of the Lord', Year, Month, Day, true, false, false, false) :-
    constants:the_epiphany_of_the_lord(ID),
    epiphany_date(Year, Month, Day),
    !.

liturgical:date(ID,'The Baptism of the Lord', Year, Month, Day, false, false, false, false) :-
    constants:the_baptism_of_the_lord(ID),
    baptism_date(Year, Month, Day),
    !.
