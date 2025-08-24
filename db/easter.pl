:- ensure_loaded(util).

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

date('easter_sunday_of_the_lords_resurrection', 'Easter Sunday of the Lords Resurrection', Year, Month, Day, true, false, false, false) :-
    easter_date(Year, Month, Day).

date('palm_sunday_of_the_lords_passion', 'Palm Sunday of the Lords Passion', Year, Month, Day, false, false, false, false) :-
    easter_date(Year, EasterMonth, EasterDay),
    weeks_after(Year, EasterMonth, EasterDay, -1, _, Month, Day).

date('monday_of_holy_week', 'Monday of Holy Week', Year, Month, Day, false, false, false, false) :-
    easter_date(Year, EasterMonth, EasterDay),
    days_after(Year, EasterMonth, EasterDay, -6, _, Month, Day).

date('tuesday_of_holy_week', 'Tuesday of Holy Week', Year, Month, Day, false, false, false, false) :-
    easter_date(Year, EasterMonth, EasterDay),
    days_after(Year, EasterMonth, EasterDay, -5, _, Month, Day).

date('wednesday_of_holy_week', 'Wednesday of Holy Week', Year, Month, Day, false, false, false, false) :-
    easter_date(Year, EasterMonth, EasterDay),
    days_after(Year, EasterMonth, EasterDay, -4, _, Month, Day).

date('holy_thursday_of_the_lords_supper', 'Holy Thursday of the Lords Supper', Year, Month, Day, false, false, false, false) :-
    easter_date(Year, EasterMonth, EasterDay),
    days_after(Year, EasterMonth, EasterDay, -3, _, Month, Day).

date('good_friday_of_the_lords_passion', 'Good Friday of the Lords Passion', Year, Month, Day, false, false, false, false) :-
    easter_date(Year, EasterMonth, EasterDay),
    days_after(Year, EasterMonth, EasterDay, -2, _, Month, Day).

date('holy_saturday', 'Holy Saturday', Year, Month, Day, false, false, false, false) :-
    easter_date(Year, EasterMonth, EasterDay),
    days_after(Year, EasterMonth, EasterDay, -1, _, Month, Day).
