:- module(christmas, [christmas_anchor_year/3]).

:- use_module(transfer).
:- use_module(util).
:- use_module(constants).
:- multifile liturgical:date_internal/8.

% Mary to Epiphany -> Christmas Octave
% Christmas to End of Year -> Christmas
christmas_anchor_year(Year, Month, AnchorYear) :-
    ( Month =:= 12 -> AnchorYear = Year ; AnchorYear is Year - 1 ).

liturgical:date_internal(ID, Year, Month, Day, true, false, false, false) :-
    constants:the_immaculate_conception_of_the_blessed_virgin_mary(ID),
    % December 8, but transferred if it falls on a Sunday in Advent
    day_of_the_week(date(Year, 12, 8), W),
    ( (W =:= 7, transferable(ID, true))
    -> % Transfer to Monday
       Month = 12, Day = 9
    ;  % Normal date
       Month = 12, Day = 8
    ).

% If Christmas (Dec 25) is a Sunday, celebrate on Friday Dec 30.
liturgical:date_internal(ID,
    Year, Month, Day, false, false, false, false) :-
    constants:the_holy_family_of_jesus_mary_and_joseph(ID),
    (
        day_of_the_week(date(Year, 12, 25), 7) ->
        Month = 12, Day = 30 ;
        next_sunday(Year, 12, 25, Year, Month, Day)
    ).
