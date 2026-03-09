:- multifile date/9.
:- discontiguous date/9.
:- ensure_loaded(easter).
:- ensure_loaded(transfer).
:- ensure_loaded(util).

ash_wednesday_date(Year, Month, Day) :-
    easter_date(Year, EasterMonth, EasterDay),
    % 40 days of lent and 6 Sundays
    days_after(Year, EasterMonth, EasterDay, -46, _, Month, Day).


date('ash_wednesday', 'Ash Wednesday', Year, Month, Day, false, false, false, false) :-
    ash_wednesday_date(Year, Month, Day),
    !.

date('saint_joseph_husband_of_mary', 'Saint Joseph, husband of Mary', Year, Month, Day, true, false, false, false) :-
    ( transferable('saint_joseph_husband_of_mary', true)
    -> next_sunday(Year, 3, 19, Year, Month, Day)
    ;  Month = 3, Day = 19
    ),
    !.
