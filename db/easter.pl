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

date('easter', 'Easter', Year, Month, Day, true, false, false, false) :-
    easter_date(Year, Month, Day).