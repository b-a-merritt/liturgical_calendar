:- module(christmas, []).

:- use_module(transfer).
:- use_module(util).
:- multifile liturgical:date/9.

liturgical:date('the_immaculate_conception_of_the_blessed_virgin_mary', 'The Immaculate Conception of the Blessed Virgin Mary', Year, Month, Day, true, false, false, false) :-
    % December 8, but transferred if it falls on a Sunday in Advent
    day_of_the_week(date(Year, 12, 8), W),
    ( (W =:= 7, transferable('the_immaculate_conception_of_the_blessed_virgin_mary', true))
    -> % Transfer to Monday
       Month = 12, Day = 9
    ;  % Normal date
       Month = 12, Day = 8
    ),
    !.

% If Christmas (Dec 25) is a Sunday, celebrate on Friday Dec 30.
liturgical:date('the_holy_family_of_jesus_mary_and_joseph',
    'The Holy Family of Jesus, Mary and Joseph',
    Year, Month, Day, false, false, false, false) :-
    (
        day_of_the_week(date(Year, 12, 25), 7) ->
        Month = 12, Day = 30 ;
        next_sunday(Year, 12, 25, Year, Month, Day)
    ),
    !.
