:- module(catchall, [christmas_anchor_year/3]).

:- use_module(advent).
:- use_module(easter).
:- use_module(epiphany).
:- use_module(lent).
:- use_module(pentecost).
:- use_module(string, [
    christmas_name/2,
    epiphany_name/2,
    season_name/4,
    christmas_octave_name/2,
    easter_octave_name/2,
    holy_week_name/2
]).
:- use_module(util).
:- use_module(constants).
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
liturgical:date(ID,'The Blessed Virgin Mary on Saturday', Year, Month, Day, false, false, true, false) :-
    constants:the_blessed_virgin_mary_on_saturday(ID),
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
    ( (TCur > TBapt, TCur < TAsh) ; (TCur > TPent, TCur < TAdv) ).

% Baptism to Ash Wednesday -> Ordinary Time
liturgical:date(_, Name, Year, Month, Day, false, false, false, false) :-
    date_stamp(Year, Month, Day, TCur),
    baptism_date(Year, BaptM, BaptD),
    date_stamp(Year, BaptM, BaptD, TBapt),
    ash_wednesday_date(Year, AshM, AshD),
    date_stamp(Year, AshM, AshD, TAsh),
    TCur > TBapt,
    TCur < TAsh,

    % Count weeks from Baptism of the Lord
    previous_sunday_before(Year, Month, Day, PSY, PSM, PSD),
    date_stamp(PSY, PSM, PSD, TPS),

    % First Sunday in Ordinary Time is the Sunday after Baptism
    sunday_on_or_after(Year, BaptM, BaptD, S0Y, S0M, S0D),
    date_stamp(S0Y, S0M, S0D, TS0),

    ( TPS >= TS0
    -> Week is floor((TPS - TS0) / (7*24*60*60)) + 1
    ;  Week = 0
    ),

    day_of_the_week(date(Year, Month, Day), WN),
    weekday_atom(WN, Weekday),
    season_name(Weekday, Week, 'Ordinary Time', Name),

    !.

% Ash Wednesday to Palm Sunday -> Lent
liturgical:date(_, Name, Year, Month, Day, false, false, false, false) :-
    date_stamp(Year, Month, Day, TCur),
    ash_wednesday_date(Year, AshM, AshD),
    date_stamp(Year, AshM, AshD, TAsh),
    palm_sunday_date(Year, PalmM, PalmD),
    date_stamp(Year, PalmM, PalmD, TPalm),
    TCur >= TAsh,
    TCur < TPalm,

    % Count weeks from Ash Wednesday
    previous_sunday_before(Year, Month, Day, PSY, PSM, PSD),
    date_stamp(PSY, PSM, PSD, TPS),

    % First Sunday of Lent is the Sunday after Ash Wednesday
    sunday_on_or_after(Year, AshM, AshD, S0Y, S0M, S0D),
    date_stamp(S0Y, S0M, S0D, TS0),

    ( TPS >= TS0
    -> Week is floor((TPS - TS0) / (7*24*60*60)) + 1
    ;  Week = 0  % Before first Sunday of Lent
    ),

    day_of_the_week(date(Year, Month, Day), WN),
    weekday_atom(WN, Weekday),
    season_name(Weekday, Week, 'Lent', Name),
    !.

% Palm Sunday to Holy Thursday -> Holy Week
liturgical:date(_, Name, Year, Month, Day, false, false, false, false) :-
    date_stamp(Year, Month, Day, TCur),
    palm_sunday_date(Year, PalmM, PalmD),
    date_stamp(Year, PalmM, PalmD, TPalm),
    easter_date(Year, EasterM, EasterD),
    days_after(Year, EasterM, EasterD, -3, _, ThurM, ThurD),  % Holy Thursday
    date_stamp(Year, ThurM, ThurD, TThur),
    TCur >= TPalm,
    TCur =< TThur,

    day_of_the_week(date(Year, Month, Day), WN),
    weekday_atom(WN, Weekday),
    holy_week_name(Weekday, Name),
    !.

% Easter to Divine Mercy Sunday -> Octave of Easter
liturgical:date(_, Name, Year, Month, Day, false, false, false, false) :-
    date_stamp(Year, Month, Day, TCur),
    easter_date(Year, EasterM, EasterD),
    date_stamp(Year, EasterM, EasterD, TEaster),
    divine_mercy_sunday_date(Year, DivineM, DivineD),
    date_stamp(Year, DivineM, DivineD, TDivine),
    TCur >= TEaster,
    TCur =< TDivine,

    day_of_the_week(date(Year, Month, Day), WN),
    weekday_atom(WN, Weekday),
    easter_octave_name(Weekday, Name),
    !.

% Divine Mercy Sunday to Pentecost -> Easter
liturgical:date(_, Name, Year, Month, Day, false, false, false, false) :-
    date_stamp(Year, Month, Day, TCur),
    divine_mercy_sunday_date(Year, DivineM, DivineD),
    date_stamp(Year, DivineM, DivineD, TDivine),
    pentecost_date(Year, PentM, PentD),
    date_stamp(Year, PentM, PentD, TPent),
    TCur > TDivine,
    TCur < TPent,

    % Count weeks from Easter
    easter_date(Year, EasterM, EasterD),
    previous_sunday_before(Year, Month, Day, PSY, PSM, PSD),
    date_stamp(PSY, PSM, PSD, TPS),
    date_stamp(Year, EasterM, EasterD, TEaster),

    Week is floor((TPS - TEaster) / (7*24*60*60)) + 1,

    day_of_the_week(date(Year, Month, Day), WN),
    weekday_atom(WN, Weekday),
    season_name(Weekday, Week, 'Easter', Name),
    !.

% Pentecost to First Sunday of Advent -> Ordinary Time
liturgical:date(_, Name, Year, Month, Day, false, false, false, false) :-
    date_stamp(Year, Month, Day, TCur),
    pentecost_date(Year, PentM, PentD),
    date_stamp(Year, PentM, PentD, TPent),
    first_sunday_advent(Year, AdvM, AdvD),
    date_stamp(Year, AdvM, AdvD, TAdv),
    TCur > TPent,
    TCur < TAdv,

    % Count weeks from Baptism of the Lord (to get continuous week numbering)
    baptism_date(Year, BaptM, BaptD),
    ash_wednesday_date(Year, AshM, AshD),
    date_stamp(Year, AshM, AshD, TAsh),

    % Count weeks in first Ordinary Time period
    date_stamp(Year, BaptM, BaptD, TBapt),
    WeeksOT1 is floor((TAsh - TBapt) / (7*24*60*60)),

    % Add weeks since Pentecost
    previous_sunday_before(Year, Month, Day, PSY, PSM, PSD),
    date_stamp(PSY, PSM, PSD, TPS),
    WeeksSincePent is floor((TPS - TPent) / (7*24*60*60)) + 1,

    Week is WeeksOT1 + WeeksSincePent,

    day_of_the_week(date(Year, Month, Day), WN),
    weekday_atom(WN, Weekday),
    season_name(Weekday, Week, 'Ordinary Time', Name),
    !.

% First Sunday of Advent to Christmas -> Advent
liturgical:date(_, Name, Year, Month, Day, false, false, false, false) :-
    date_stamp(Year, Month, Day, TCur),
    first_sunday_advent(Year, AdvM, AdvD),
    date_stamp(Year, AdvM, AdvD, TAdv),
    date_stamp(Year, 12, 25, TXmas),
    TCur >= TAdv,
    TCur < TXmas,

    % Count weeks from first Sunday of Advent
    previous_sunday_before(Year, Month, Day, PSY, PSM, PSD),
    date_stamp(PSY, PSM, PSD, TPS),

    ( TPS >= TAdv
    -> Week is floor((TPS - TAdv) / (7*24*60*60)) + 1
    ;  Week = 0  % Before first Sunday of Advent (shouldn't happen)
    ),

    day_of_the_week(date(Year, Month, Day), WN),
    weekday_atom(WN, Weekday),
    season_name(Weekday, Week, 'Advent', Name),
    !.

% Christmas Day to Epiphany -> Christmas Octave
liturgical:date(_, Name, Year, Month, Day, false, false, false, false) :-
    date_stamp(Year, Month, Day, TCur),

    christmas_anchor_year(Year, Month, CYear),
    date_stamp(CYear, 12, 25, TXmas),
    TCur >= TXmas,

    Secs is TCur - TXmas,
    DaysSince is floor(Secs / (24 * 60 * 60)),

    christmas_octave_name(DaysSince, Name).
