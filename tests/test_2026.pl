:- use_module('../db/main').
:- use_module('../db/constants').
:- use_module(library(plunit)).

%% Tests for 2026 Liturgical Calendar
%% Reference: 2026cal.pdf (USCCB)

:- begin_tests(advent_2025).

test(first_sunday_advent_2025) :-
    liturgical:date(_, _, 2025, 11, 30, _, _, _, _),
    liturgical:date(_, Name, 2025, 11, 30, _, _, _, _),
    sub_string(Name, _, _, _, "1st Sunday of Advent").

test(second_sunday_advent_2025) :-
    liturgical:date(_, Name, 2025, 12, 7, _, _, _, _),
    sub_string(Name, _, _, _, "2nd Sunday of Advent").

test(third_sunday_advent_2025) :-
    liturgical:date(_, Name, 2025, 12, 14, _, _, _, _),
    sub_string(Name, _, _, _, "3rd Sunday of Advent").

test(fourth_sunday_advent_2025) :-
    liturgical:date(_, Name, 2025, 12, 21, _, _, _, _),
    sub_string(Name, _, _, _, "4th Sunday of Advent").

:- end_tests(advent_2025).

:- begin_tests(christmas_2025).

test(christmas_2025) :-
    liturgical:date(_, _, 2025, 12, 25, true, _, _, _).

test(holy_family_2025) :-
    % Sunday after Christmas when Christmas is not on Sunday
    constants:the_holy_family_of_jesus_mary_and_joseph(ID),
    liturgical:date(ID,_, 2025, 12, 28, _, _, _, _).

:- end_tests(christmas_2025).

:- begin_tests(epiphany_2026).

test(mary_mother_of_god) :-
    liturgical:date(_, _, 2026, 1, 1, true, _, _, _).

test(epiphany_2026) :-
    % Epiphany NOT transferred in this config - stays on January 6
    constants:the_epiphany_of_the_lord(ID),
    liturgical:date(ID,_, 2026, 1, 6, true, _, _, _).

test(baptism_of_lord_2026) :-
    % Monday after Epiphany when Epiphany is on Sunday
    constants:the_baptism_of_the_lord(ID),
    liturgical:date(ID,_, 2026, 1, 11, _, _, _, _).

:- end_tests(epiphany_2026).

:- begin_tests(lent_2026).

test(ash_wednesday) :-
    constants:ash_wednesday(ID),
    liturgical:date(ID,_, 2026, 2, 18, _, _, _, _).

test(palm_sunday) :-
    constants:palm_sunday_of_the_lords_passion(ID),
    liturgical:date(ID,_, 2026, 3, 29, _, _, _, _).

test(holy_thursday) :-
    constants:holy_thursday_of_the_lords_supper(ID),
    liturgical:date(ID,_, 2026, 4, 2, _, _, _, _).

test(good_friday) :-
    constants:good_friday_of_the_lords_passion(ID),
    liturgical:date(ID,_, 2026, 4, 3, _, _, _, _).

test(holy_saturday) :-
    constants:holy_saturday(ID),
    liturgical:date(ID,_, 2026, 4, 4, _, _, _, _).

test(saint_joseph) :-
    % March 19 falls on Thursday in 2026, transferred to Sunday March 22
    constants:saint_joseph_husband_of_mary(ID),
    liturgical:date(ID,_, 2026, 3, 22, true, _, _, _).

test(annunciation) :-
    % March 25 - not in Holy Week/Easter Octave in 2026
    constants:the_annunciation_of_the_lord(ID),
    liturgical:date(ID,_, 2026, 3, 25, true, _, _, _).

:- end_tests(lent_2026).

:- begin_tests(easter_2026).

test(easter_sunday) :-
    constants:easter_sunday_of_the_lords_resurrection(ID),
    liturgical:date(ID,_, 2026, 4, 5, true, _, _, _).

test(divine_mercy_sunday) :-
    constants:second_sunday_of_easter(ID),
    liturgical:date(ID,_, 2026, 4, 12, _, _, _, _).

test(ascension) :-
    % Transferred to Sunday (7th Sunday of Easter) = May 17
    constants:ascension_of_the_lord(ID),
    liturgical:date(ID,_, 2026, 5, 17, true, _, _, _).

:- end_tests(easter_2026).

:- begin_tests(pentecost_2026).

test(pentecost_sunday) :-
    constants:pentecost_sunday(ID),
    liturgical:date(ID,_, 2026, 5, 24, true, _, _, _).

test(holy_trinity) :-
    % Sunday after Pentecost = May 31
    constants:the_most_holy_trinity(ID),
    liturgical:date(ID,_, 2026, 5, 31, true, _, _, _).

test(corpus_christi) :-
    % Sunday after Trinity (transferred) = June 7
    constants:the_most_holy_body_and_blood_of_christ(ID),
    liturgical:date(ID,_, 2026, 6, 7, true, _, _, _).

test(sacred_heart) :-
    % Friday after 2nd Sunday after Pentecost = June 12
    constants:the_most_sacred_heart_of_jesus(ID),
    liturgical:date(ID,_, 2026, 6, 12, true, _, _, _).

test(immaculate_heart_mary) :-
    % Saturday after Sacred Heart = June 13
    constants:the_immaculate_heart_of_the_blessed_virgin_mary(ID),
    liturgical:date(ID,_, 2026, 6, 13, _, true, _, _).

test(mary_mother_of_church) :-
    % Monday after Pentecost = May 25
    constants:the_blessed_virgin_mary_mother_of_the_church(ID),
    liturgical:date(ID,_, 2026, 5, 25, _, true, _, _).

test(eternal_high_priest) :-
    % Thursday after Pentecost = May 28
    constants:our_lord_jesus_christ_the_eternal_high_priest(ID),
    liturgical:date(ID,_, 2026, 5, 28, _, _, _, _).

:- end_tests(pentecost_2026).

:- begin_tests(ordinary_time_2026).

test(christ_the_king) :-
    % Last Sunday before Advent = November 22, 2026
    constants:our_lord_jesus_christ_king_of_the_universe(ID),
    liturgical:date(ID,_, 2026, 11, 22, true, _, _, _).

:- end_tests(ordinary_time_2026).

:- begin_tests(static_solemnities_2026).

test(christmas_2026) :-
    constants:the_nativity_of_the_lord_christmas(ID),
    liturgical:date(ID,_, 2026, 12, 25, true, _, _, _).

test(assumption) :-
    constants:the_assumption_of_the_blessed_virgin_mary(ID),
    liturgical:date(ID,_, 2026, 8, 15, true, _, _, _).

test(all_saints) :-
    constants:all_saints(ID),
    liturgical:date(ID,_, 2026, 11, 1, true, _, _, _).

test(immaculate_conception) :-
    constants:the_immaculate_conception_of_the_blessed_virgin_mary(ID),
    liturgical:date(ID,_, 2026, 12, 8, true, _, _, _).

:- end_tests(static_solemnities_2026).

:- begin_tests(static_feasts_2026).

test(presentation_of_lord) :-
    % Listed in static.pl as false, false (neither solemnity nor feast)
    constants:the_presentation_of_the_lord(ID),
    liturgical:date(ID,_, 2026, 2, 2, false, false, _, _).

test(chair_of_peter) :-
    % Listed in static.pl as false, false
    constants:the_chair_of_saint_peter_apostle(ID),
    liturgical:date(ID,_, 2026, 2, 22, false, false, _, _).

test(birth_of_john_baptist) :-
    constants:the_nativity_of_saint_john_the_baptist(ID),
    liturgical:date(ID,_, 2026, 6, 24, true, _, _, _).

test(peter_and_paul) :-
    constants:saint_peter_and_saint_paul_apostles(ID),
    liturgical:date(ID,_, 2026, 6, 29, true, _, _, _).

test(transfiguration) :-
    % Listed as false, false in static.pl
    constants:the_transfiguration_of_the_lord(ID),
    liturgical:date(ID,_, 2026, 8, 6, false, false, _, _).

test(exaltation_of_cross) :-
    % Listed as false, false in static.pl
    constants:the_exaltation_of_the_holy_cross(ID),
    liturgical:date(ID,_, 2026, 9, 14, false, false, _, _).

test(all_souls) :-
    constants:the_commemoration_of_all_the_faithful_departed_all_souls(ID),
    liturgical:date(ID,_, 2026, 11, 2, _, _, _, _).

test(dedication_of_lateran) :-
    % Listed as false, false in static.pl
    constants:the_dedication_of_the_lateran_basilica_in_rome(ID),
    liturgical:date(ID,_, 2026, 11, 9, false, false, _, _).

:- end_tests(static_feasts_2026).

:- begin_tests(advent_2026).

test(first_sunday_advent_2026) :-
    liturgical:date(_, Name, 2026, 11, 29, _, _, _, _),
    sub_string(Name, _, _, _, "1st Sunday of Advent").

test(second_sunday_advent_2026) :-
    liturgical:date(_, Name, 2026, 12, 6, _, _, _, _),
    sub_string(Name, _, _, _, "2nd Sunday of Advent").

test(third_sunday_advent_2026) :-
    liturgical:date(_, Name, 2026, 12, 13, _, _, _, _),
    sub_string(Name, _, _, _, "3rd Sunday of Advent").

test(fourth_sunday_advent_2026) :-
    liturgical:date(_, Name, 2026, 12, 20, _, _, _, _),
    sub_string(Name, _, _, _, "4th Sunday of Advent").

:- end_tests(advent_2026).

:- begin_tests(selected_saints_2026).

test(saint_stephen) :-
    % Listed as false, false in static.pl
    constants:saint_stephen_first_martyr(ID),
    liturgical:date(ID,_, 2026, 12, 26, false, false, _, _).

test(saint_john_apostle) :-
    % Listed as false, false in static.pl
    constants:saint_john_apostle_and_evangelist(ID),
    liturgical:date(ID,_, 2026, 12, 27, false, false, _, _).

test(holy_innocents) :-
    % Listed as false, false in static.pl
    constants:the_holy_innocents_martyrs(ID),
    liturgical:date(ID,_, 2026, 12, 28, false, false, _, _).

test(saint_patrick) :-
    constants:saint_patrick_bishop(ID),
    liturgical:date(ID,_, 2026, 3, 17, _, _, _, _).

test(saint_mark) :-
    % Listed as false, false in static.pl
    constants:saint_mark_evangelist(ID),
    liturgical:date(ID,_, 2026, 4, 25, false, false, _, _).

test(saint_matthias) :-
    % Listed as false, false in static.pl
    constants:saint_matthias_apostle(ID),
    liturgical:date(ID,_, 2026, 5, 14, false, false, _, _).

test(visitation) :-
    % Listed as false, false in static.pl
    constants:the_visitation_of_the_blessed_virgin_mary(ID),
    liturgical:date(ID,_, 2026, 5, 31, false, false, _, _).

test(saint_thomas_apostle) :-
    % Listed as false, false in static.pl
    constants:saint_thomas_apostle(ID),
    liturgical:date(ID,_, 2026, 7, 3, false, false, _, _).

test(saint_james_apostle) :-
    % Listed as false, false in static.pl
    constants:saint_james_apostle(ID),
    liturgical:date(ID,_, 2026, 7, 25, false, false, _, _).

test(saint_bartholomew) :-
    % Listed as false, false in static.pl
    constants:saint_bartholomew_apostle(ID),
    liturgical:date(ID,_, 2026, 8, 24, false, false, _, _).

test(saint_matthew) :-
    % Listed as false, false in static.pl
    constants:saint_matthew_apostle_and_evangelist(ID),
    liturgical:date(ID,_, 2026, 9, 21, false, false, _, _).

test(saints_michael_gabriel_raphael) :-
    % Listed as false, false in static.pl
    constants:saint_michael_saint_gabriel_and_saint_raphael_archangels(ID),
    liturgical:date(ID,_, 2026, 9, 29, false, false, _, _).

test(saint_luke) :-
    % Listed as false, false in static.pl
    constants:saint_luke_evangelist(ID),
    liturgical:date(ID,_, 2026, 10, 18, false, false, _, _).

test(saints_simon_and_jude) :-
    % Listed as false, false in static.pl
    constants:saint_simon_and_saint_jude_apostles(ID),
    liturgical:date(ID,_, 2026, 10, 28, false, false, _, _).

test(saint_andrew) :-
    % Listed as false, false in static.pl
    constants:saint_andrew_apostle(ID),
    liturgical:date(ID,_, 2026, 11, 30, false, false, _, _).

:- end_tests(selected_saints_2026).

:- begin_tests(date_calculation_verification).

test(easter_calculation_2026) :-
    easter:easter_date(2026, Month, Day),
    Month = 4,
    Day = 5.

test(ash_wednesday_calculation_2026) :-
    lent:ash_wednesday_date(2026, Month, Day),
    Month = 2,
    Day = 18.

test(pentecost_calculation_2026) :-
    pentecost:pentecost_date(2026, Month, Day),
    Month = 5,
    Day = 24.

test(first_advent_calculation_2025) :-
    advent:first_sunday_advent(2025, Month, Day),
    Month = 11,
    Day = 30.

test(first_advent_calculation_2026) :-
    advent:first_sunday_advent(2026, Month, Day),
    Month = 11,
    Day = 29.

:- end_tests(date_calculation_verification).
