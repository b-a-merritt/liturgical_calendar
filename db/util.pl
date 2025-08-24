:- module(util, [weeks_after/7, next_sunday/6]).

:- use_module(library(date)).


weeks_after(Year, Month, Day, Weeks, Newyear, Newmonth, Newday) :-
    date_time_stamp(date(Year, Month, Day, 0, 0, 0, 0, 'UTC', _), Stamp),
    WeeksInSeconds is Weeks * 7 * 24 * 60 * 60,
    NewStamp is Stamp + WeeksInSeconds,
    stamp_date_time(NewStamp, DateTime, 'UTC'),
    date_time_value(year, DateTime, Newyear),
    date_time_value(month, DateTime, Newmonth),
    date_time_value(day, DateTime, Newday).

next_sunday(Year, Month, Day, Nextyear, Nextmonth, Nextday) :-
    day_of_the_week(date(Year, Month, Day), W0), % W0 in 1..7, Monday=1, Sunday=7
    Daysadded is (7 - W0) mod 7, % days until (same/next) Sunday
    ( Daysadded =:= 0 -> Add is 7 ; Add is Daysadded ), % strictly after: if already Sunday, add 7
    date_time_stamp(date(Year, Month, Day, 0,0,0,0,-,-), T0),
    Seconds is Add * 24 * 60 * 60,
    T is T0 + Seconds,
    stamp_date_time(T, date(Nextyear, Nextmonth, Nextday, _,_,_,_,_,_), 'UTC').
