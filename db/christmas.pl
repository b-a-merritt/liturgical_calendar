:- module(christmas, []).

:- use_module(util).
:- multifile liturgical:date/9.

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
