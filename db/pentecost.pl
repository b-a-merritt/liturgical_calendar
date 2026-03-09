:- module(pentecost, [pentecost_date/3]).

:- use_module(easter).
:- use_module(transfer).
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

liturgical:date('the_most_holy_body_and_blood_of_christ', 'The Most Holy Body and Blood of Christ', Year, Month, Day, true, false, false, false) :-
    pentecost_date(Year, PentecostMonth, PentecostDay),
    ( transferable('the_most_holy_body_and_blood_of_christ', true)
    -> % Sunday after Trinity Sunday (2 weeks after Pentecost)
       weeks_after(Year, PentecostMonth, PentecostDay, 2, _, Month, Day)
    ;  % Thursday after Trinity Sunday
       weeks_after(Year, PentecostMonth, PentecostDay, 1, _, TrinityM, TrinityD),
       days_after(Year, TrinityM, TrinityD, 4, _, Month, Day)
    ),
    !.

liturgical:date('the_most_sacred_heart_of_jesus', 'The Most Sacred Heart of Jesus', Year, Month, Day, true, false, false, false) :-
    pentecost_date(Year, PentecostMonth, PentecostDay),
    % Friday after 2nd Sunday after Pentecost (19 days after Pentecost)
    days_after(Year, PentecostMonth, PentecostDay, 19, _, Month, Day),
    !.

liturgical:date('the_immaculate_heart_of_the_blessed_virgin_mary', 'The Immaculate Heart of the Blessed Virgin Mary', Year, Month, Day, false, true, false, false) :-
    % Saturday after Sacred Heart (20 days after Pentecost)
    pentecost_date(Year, PentecostMonth, PentecostDay),
    days_after(Year, PentecostMonth, PentecostDay, 20, _, Month, Day),
    !.

liturgical:date('the_blessed_virgin_mary_mother_of_the_church', 'The Blessed Virgin Mary, Mother of the Church', Year, Month, Day, false, true, false, false) :-
    % Monday after Pentecost
    pentecost_date(Year, PentecostMonth, PentecostDay),
    days_after(Year, PentecostMonth, PentecostDay, 1, _, Month, Day),
    !.

liturgical:date('our_lord_jesus_christ_the_eternal_high_priest', 'Our Lord Jesus Christ, the Eternal High Priest', Year, Month, Day, false, false, false, false) :-
    % Thursday after Pentecost
    pentecost_date(Year, PentecostMonth, PentecostDay),
    days_after(Year, PentecostMonth, PentecostDay, 4, _, Month, Day),
    !.
