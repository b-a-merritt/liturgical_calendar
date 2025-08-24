:- multifile date/9.
:- discontiguous date/9.
:- ensure_loaded(easter).
:- ensure_loaded(util).

date('pentecost_sunday', 'Pentecost Sunday', Year, Month, Day, true, false, false, false) :-
    easter_date(Year, EasterMonth, EasterDay),
    days_after(Year, EasterMonth, EasterDay, 49, _, Month, Day).

date('the_most_holy_trinity', 'The Most Holy Trinity', Year, Month, Day, true, false, false, false) :-
    date('pentecost_sunday', _, Year, PentecostMonth, PentecostDay, _, _, _, _),
    weeks_after(Year, PentecostMonth, PentecostDay, 1, _, Month, Day).