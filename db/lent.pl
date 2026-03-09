:- module(lent, [ash_wednesday_date/3]).

:- use_module(easter).
:- use_module(transfer).
:- use_module(util).
:- multifile liturgical:date/9.

ash_wednesday_date(Year, Month, Day) :-
    easter_date(Year, EasterMonth, EasterDay),
    % 40 days of lent and 6 Sundays
    days_after(Year, EasterMonth, EasterDay, -46, _, Month, Day).


liturgical:date('ash_wednesday', 'Ash Wednesday', Year, Month, Day, false, false, false, false) :-
    ash_wednesday_date(Year, Month, Day),
    !.

liturgical:date('saint_joseph_husband_of_mary', 'Saint Joseph, husband of Mary', Year, Month, Day, true, false, false, false) :-
    ( transferable('saint_joseph_husband_of_mary', true)
    -> next_sunday(Year, 3, 19, Year, Month, Day)
    ;  Month = 3, Day = 19
    ),
    !.
