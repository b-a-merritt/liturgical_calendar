:- module(pentecost, [pentecost_date/3]).

:- use_module(easter).
:- use_module(transfer).
:- use_module(util).
:- use_module(constants).
:- multifile liturgical:date_internal/8.

pentecost_date(Year, Month, Day) :-
    easter_date(Year, EasterMonth, EasterDay),
    % Pentecost is 49 days after Easter (50th day inclusive)
    days_after(Year, EasterMonth, EasterDay, 49, _, Month, Day).

liturgical:date_internal(ID, Year, Month, Day, true, false, false, false) :-
    constants:pentecost_sunday(ID),
    pentecost_date(Year, Month, Day).

liturgical:date_internal(ID, Year, Month, Day, true, false, false, false) :-
    constants:the_most_holy_trinity(ID),
    pentecost_date(Year, PentecostMonth, PentecostDay),
    weeks_after(Year, PentecostMonth, PentecostDay, 1, _, Month, Day).

liturgical:date_internal(ID, Year, Month, Day, true, false, false, false) :-
    constants:the_most_holy_body_and_blood_of_christ(ID),
    pentecost_date(Year, PentecostMonth, PentecostDay),
    ( transferable(ID, true)
    -> % Sunday after Trinity Sunday (2 weeks after Pentecost)
       weeks_after(Year, PentecostMonth, PentecostDay, 2, _, Month, Day)
    ;  % Thursday after Trinity Sunday
       weeks_after(Year, PentecostMonth, PentecostDay, 1, _, TrinityM, TrinityD),
       days_after(Year, TrinityM, TrinityD, 4, _, Month, Day)
    ).

liturgical:date_internal(ID, Year, Month, Day, true, false, false, false) :-
    constants:the_most_sacred_heart_of_jesus(ID),
    pentecost_date(Year, PentecostMonth, PentecostDay),
    % Friday after 2nd Sunday after Pentecost (19 days after Pentecost)
    days_after(Year, PentecostMonth, PentecostDay, 19, _, Month, Day).

liturgical:date_internal(ID, Year, Month, Day, false, true, false, false) :-
    constants:the_immaculate_heart_of_the_blessed_virgin_mary(ID),
    % Saturday after Sacred Heart (20 days after Pentecost)
    pentecost_date(Year, PentecostMonth, PentecostDay),
    days_after(Year, PentecostMonth, PentecostDay, 20, _, Month, Day).

liturgical:date_internal(ID, Year, Month, Day, false, true, false, false) :-
    constants:the_blessed_virgin_mary_mother_of_the_church(ID),
    % Monday after Pentecost
    pentecost_date(Year, PentecostMonth, PentecostDay),
    days_after(Year, PentecostMonth, PentecostDay, 1, _, Month, Day).

liturgical:date_internal(ID, Year, Month, Day, false, false, false, false) :-
    constants:our_lord_jesus_christ_the_eternal_high_priest(ID),
    % Thursday after Pentecost
    pentecost_date(Year, PentecostMonth, PentecostDay),
    days_after(Year, PentecostMonth, PentecostDay, 4, _, Month, Day).
