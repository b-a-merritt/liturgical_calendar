:- module(easter, [
    easter_date/3,
    palm_sunday_date/3,
    divine_mercy_sunday_date/3
]).

:- use_module(util).
:- use_module(transfer).
:- use_module(constants).
:- multifile liturgical:date_internal/8.

easter_date(Year, Month, Day) :-
    A is Year mod 19,
    B is floor(Year / 100),
    C is Year mod 100,
    D is floor(B / 4),
    E is B mod 4,
    G is floor((8 * B + 13) / 25),
    H is (19 * A + B - D - G + 15) mod 30,
    I is floor(C / 4),
    K is C mod 4,
    L is (32 + 2 * E + 2 * I - H - K) mod 7,
    M is floor((A + 11 * H + 19 * L) / 433),
    N is floor((H + L - 7 * M + 114) / 31),
    P is (H + L - 7 * M + 33 * N + 19) mod 32,
    Month = N,
    Day = P.

palm_sunday_date(Year, Month, Day) :-
    easter_date(Year, EasterMonth, EasterDay),
    weeks_after(Year, EasterMonth, EasterDay, -1, _, Month, Day).

divine_mercy_sunday_date(Year, Month, Day) :-
    easter_date(Year, EasterMonth, EasterDay),
    weeks_after(Year, EasterMonth, EasterDay, 1, _, Month, Day).


liturgical:date_internal(ID, Year, Month, Day, true, false, false, false) :-
    constants:easter_sunday_of_the_lords_resurrection(ID),
    easter_date(Year, Month, Day).

liturgical:date_internal(ID, Year, Month, Day, false, false, false, false) :-
    constants:palm_sunday_of_the_lords_passion(ID),
    palm_sunday_date(Year, Month, Day).

liturgical:date_internal(ID, Year, Month, Day, false, false, false, false) :-
    constants:holy_thursday_of_the_lords_supper(ID),
    easter_date(Year, EasterMonth, EasterDay),
    days_after(Year, EasterMonth, EasterDay, -3, _, Month, Day).

liturgical:date_internal(ID, Year, Month, Day, false, false, false, false) :-
    constants:good_friday_of_the_lords_passion(ID),
    easter_date(Year, EasterMonth, EasterDay),
    days_after(Year, EasterMonth, EasterDay, -2, _, Month, Day).

liturgical:date_internal(ID, Year, Month, Day, false, false, false, false) :-
    constants:holy_saturday(ID),
    easter_date(Year, EasterMonth, EasterDay),
    days_after(Year, EasterMonth, EasterDay, -1, _, Month, Day).

liturgical:date_internal(ID, Year, Month, Day, false, false, false, false) :-
    constants:second_sunday_of_easter(ID),
    divine_mercy_sunday_date(Year, Month, Day).

liturgical:date_internal(ID, Year, Month, Day, true, false, false, false) :-
    constants:ascension_of_the_lord(ID),
    easter_date(Year, EasterMonth, EasterDay),
    % Ascension is 40 days after Easter (39 days + Easter itself = 40th day)
    ( transferable(ID, true)
    -> % Transferred to 7th Sunday of Easter
       days_after(Year, EasterMonth, EasterDay, 42, _, Month, Day)  % 6 weeks = 42 days
    ;  % Thursday, 39 days after Easter
       days_after(Year, EasterMonth, EasterDay, 39, _, Month, Day)
    ).
