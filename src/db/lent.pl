:- module(lent, [ash_wednesday_date/3]).

:- use_module(easter).
:- use_module(transfer).
:- use_module(util).
:- use_module(constants).
:- multifile liturgical:date_internal/8.

ash_wednesday_date(Year, Month, Day) :-
    easter_date(Year, EasterMonth, EasterDay),
    % 40 days of lent and 6 Sundays
    days_after(Year, EasterMonth, EasterDay, -46, _, Month, Day).


liturgical:date_internal(ID, Year, Month, Day, false, false, false, false) :-
    constants:ash_wednesday(ID),
    ash_wednesday_date(Year, Month, Day).

liturgical:date_internal(ID, Year, Month, Day, true, false, false, false) :-
    constants:saint_joseph_husband_of_mary(ID),
    ( transferable(ID, true)
    -> next_sunday(Year, 3, 19, Year, Month, Day)
    ;  Month = 3, Day = 19
    ).

liturgical:date_internal(ID, Year, Month, Day, true, false, false, false) :-
    constants:the_annunciation_of_the_lord(ID),
    % Annunciation is March 25, but if it falls during Holy Week or Easter Octave, it's transferred
    palm_sunday_date(Year, PalmM, PalmD),
    divine_mercy_sunday_date(Year, DivineM, DivineD),
    date_stamp(Year, 3, 25, TAnnunc),
    date_stamp(Year, PalmM, PalmD, TPalm),
    date_stamp(Year, DivineM, DivineD, TDivine),
    ( (TAnnunc >= TPalm, TAnnunc =< TDivine)
    -> % Transfer to Monday after Divine Mercy Sunday
       days_after(Year, DivineM, DivineD, 1, _, Month, Day)
    ;  % Normal date
       Month = 3, Day = 25
    ).
