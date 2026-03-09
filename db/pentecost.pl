:- module(pentecost, [pentecost_date/3]).

:- use_module(easter).
:- use_module(util).
:- multifile liturgical:date/9.

pentecost_date(Year, Month, Day) :-
    easter_date(Year, EasterMonth, EasterDay),
    % Pentecost is 49 days after Easter (50th day inclusive)
    days_after(Year, EasterMonth, EasterDay, 49, _, Month, Day).

liturgical:date('pentecost_sunday', 'Pentecost Sunday', Year, Month, Day, true, false, false, false) :-
    pentecost_date(Year, Month, Day),
    !.

liturgical:date('the_most_holy_trinity', 'The Most Holy Trinity', Year, Month, Day, true, false, false, false) :-
    pentecost_date(Year, PentecostMonth, PentecostDay),
    weeks_after(Year, PentecostMonth, PentecostDay, 1, _, Month, Day),
    !.
