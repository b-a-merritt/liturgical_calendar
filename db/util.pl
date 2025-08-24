:- module(util, [days_after/7, weeks_after/7, next_sunday/6, nearest_sunday/6]).

:- use_module(library(date)).


days_after(Year, Month, Day, Numdays, Newyear, Newmonth, Newday) :-
    date_time_stamp(date(Year, Month, Day, 0, 0, 0, 0, 'UTC', _), Stamp),
    DayInSeconds is Numdays * 24 * 60 * 60,
    NewStamp is Stamp + DayInSeconds,
    stamp_date_time(NewStamp, DateTime, 'UTC'),
    date_time_value(year, DateTime, Newyear),
    date_time_value(month, DateTime, Newmonth),
    date_time_value(day, DateTime, Newday).

weeks_after(Year, Month, Day, Numweeks, Newyear, Newmonth, Newday) :-
    days_after(Year, Month, Day, Numweeks * 7, Newyear, Newmonth, Newday). 

next_sunday(Year, Month, Day, Nextyear, Nextmonth, Nextday) :-
    day_of_the_week(date(Year, Month, Day), W0), % W0 in 1..7, Monday=1, Sunday=7
    Daysadded is (7 - W0) mod 7, % days until (same/next) Sunday
    ( Daysadded =:= 0 -> Add is 7 ; Add is Daysadded ), % strictly after: if already Sunday, add 7
    date_time_stamp(date(Year, Month, Day, 0,0,0,0,-,-), T0),
    Seconds is Add * 24 * 60 * 60,
    T is T0 + Seconds,
    stamp_date_time(T, date(Nextyear, Nextmonth, Nextday, _,_,_,_,_,_), 'UTC').

nearest_sunday(Y0, M0, D0, Y, M, D) :-
    date_time_stamp(date(Y0, M0, D0, 0,0,0,0,'UTC',-), T0),
    next_sunday(Y0, M0, D0, Yn, Mn, Dn),
    weeks_after(Yn, Mn, Dn, -1, Yp, Mp, Dp),
    date_time_stamp(date(Yn, Mn, Dn, 0,0,0,0,'UTC',-), Tn),
    date_time_stamp(date(Yp, Mp, Dp, 0,0,0,0,'UTC',-), Tp),
    DNext is abs(Tn - T0), % compare next sunday Tn (timestamp next)
    DPrev is abs(T0 - Tp), % with previous sunday Tp (timestamp prev)
    ( DPrev =< DNext
    -> Y = Yp, M = Mp, D = Dp
    ;  Y = Yn, M = Mn, D = Dn
    ).
