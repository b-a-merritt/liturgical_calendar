:- multifile date/9.
:- discontiguous date/9.
:- ensure_loaded(easter).
:- ensure_loaded(util).

date('ash_wednesday', 'Ash Wednesday', Year, Month, Day, false, false, false, false) :-
    easter_date(Year, EasterMonth, EasterDay),
    days_after(Year, EasterMonth, EasterDay, -46, _, Month, Day).
