:- module(catchall, [christmas_anchor_year/3]).

:- use_module(advent).
:- use_module(epiphany).
:- use_module(lent).
:- use_module(pentecost).
:- use_module(string, [
    christmas_name/2,
    epiphany_name/2,
    season_name/4,
    christmas_octave_name/2
]).
:- use_module(util).
:- multifile liturgical:date/9.

% Mary to Epiphany -> Christmas Octave
% Christmas to End of Year -> Christmas
christmas_anchor_year(Year, Month, AnchorYear) :-
    ( Month =:= 12 -> AnchorYear = Year ; AnchorYear is Year - 1 ).

% Mary to Epiphany -> Christmas
liturgical:date(_, Name, Year, Month, Day, false, false, false, false) :-
    date_stamp(Year, Month, Day, TCur),

    epiphany_date(Year, EpM, EpD),
    date_stamp(Year, EpM, EpD, TEpi),
    TCur < TEpi,

    day_of_the_week(date(Year, Month, Day), WN),
    weekday_atom(WN, Weekday),
    christmas_name(Weekday, Name).

% Epiphany to Baptism -> Epiphany
liturgical:date(_, Name, Year, Month, Day, false, false, false, false) :-
    date_stamp(Year, Month, Day, TCur),

    baptism_date(Year, BaptM, BaptD),
    date_stamp(Year, BaptM, BaptD, TBapt),
    TCur < TBapt,

    day_of_the_week(date(Year, Month, Day), WN),
    weekday_atom(WN, Weekday),
    epiphany_name(Weekday, Name).


% Blessed Virgin Mary on Saturday (Optional Memorial in Ordinary Time)
% According to liturgical norms, this optional memorial is available on Saturdays
% in Ordinary Time when no solemnity, feast, or obligatory memorial is assigned
liturgical:date('the_blessed_virgin_mary_on_saturday', 'The Blessed Virgin Mary on Saturday', Year, Month, Day, false, false, true, false) :-
    % Must be a Saturday
    day_of_the_week(date(Year, Month, Day), 6),

    % Must be in Ordinary Time (either after Baptism before Ash Wednesday, or after Pentecost before Advent)
    date_stamp(Year, Month, Day, TCur),
    baptism_date(Year, BaptM, BaptD),
    date_stamp(Year, BaptM, BaptD, TBapt),
    ash_wednesday_date(Year, AshM, AshD),
    date_stamp(Year, AshM, AshD, TAsh),
    pentecost_date(Year, PentM, PentD),
    date_stamp(Year, PentM, PentD, TPent),
    first_sunday_advent(Year, AdvM, AdvD),
    date_stamp(Year, AdvM, AdvD, TAdv),

    % Check if in Ordinary Time
    ( (TCur > TBapt, TCur < TAsh) ; (TCur > TPent, TCur < TAdv) ),

    !.

% Baptism to Ash Wednesday -> Ordinary
liturgical:date(_, Name, Year, Month, Day, false, false, false, false) :-
    date_stamp(Year, Month, Day, TCur),
    ash_wednesday_date(Year, AshM, AshD),
    date_stamp(Year, AshM, AshD, TAsh),
    TCur < TAsh,

    % Compute week by counting Sundays that occurred strictly before current day,
    % starting from the first Sunday ON/AFTER Dec 25.
    christmas_anchor_year(Year, Month, CYear),
    sunday_on_or_after(CYear, 12, 25, S0Y, S0M, S0D),
    previous_sunday_before(Year, Month, Day, PSY, PSM, PSD),

    % If the previous-Sunday-before(current) is before the anchor Sunday,
    % zero Sundays have "passed" yet; else count whole weeks between Sundays.
    ( date_stamp(PSY,PSM,PSD, TPS),
      date_stamp(S0Y,S0M,S0D, TS0),
      TPS >= TS0
    -> SundaysPassed is ((TPS - TS0) // (7*24*60*60)) + 1
    ;  SundaysPassed = 0
    ),
    Week is SundaysPassed + 1,

    % Weekday label for the current date
    day_of_the_week(date(Year, Month, Day), WN),
    weekday_atom(WN, Weekday),
    season_name(Weekday, Week, 'Christmas', Name),

    !.  % keep this catch-all last so specific feasts match before it

% Ash Wednesday to Palm Sunday -> Lent


% Palm Sunday to Holy Thursday -> Holy Week


% Easter to Divine Mercy Sunday -> Octave of Easter


% Divine Mercy Sunday to Pentecost -> Easter


% Pentecost to First Sunday of Advent -> Ordinary


% First Sunday of Advent to Christmas -> Advent


%
liturgical:date(_, Name, Year, Month, Day, false, false, false, false) :-
    date_stamp(Year, Month, Day, TCur),

    christmas_anchor_year(Year, Month, CYear),
    date_stamp(CYear, 12, 25, TXmas),
    TCur >= TXmas,

    Secs is TCur - TXmas,
    DaysSince is floor(Secs / (24 * 60 * 60)),

    christmas_octave_name(DaysSince, Name).
