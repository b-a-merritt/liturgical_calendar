:- use_module('../db/main').
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
    liturgical:date('the_holy_family_of_jesus_mary_and_joseph', _, 2025, 12, 28, _, _, _, _).

:- end_tests(christmas_2025).

:- begin_tests(epiphany_2026).

test(mary_mother_of_god) :-
    liturgical:date(_, _, 2026, 1, 1, true, _, _, _).

test(epiphany_2026) :-
    % Epiphany NOT transferred in this config - stays on January 6
    liturgical:date('the_epiphany_of_the_lord', _, 2026, 1, 6, true, _, _, _).

test(baptism_of_lord_2026) :-
    % Monday after Epiphany when Epiphany is on Sunday
    liturgical:date('the_baptism_of_the_lord', _, 2026, 1, 11, _, _, _, _).

:- end_tests(epiphany_2026).

:- begin_tests(lent_2026).

test(ash_wednesday) :-
    liturgical:date('ash_wednesday', _, 2026, 2, 18, _, _, _, _).

test(palm_sunday) :-
    liturgical:date('palm_sunday_of_the_lords_passion', _, 2026, 3, 29, _, _, _, _).

test(holy_thursday) :-
    liturgical:date('holy_thursday_of_the_lords_supper', _, 2026, 4, 2, _, _, _, _).

test(good_friday) :-
    liturgical:date('good_friday_of_the_lords_passion', _, 2026, 4, 3, _, _, _, _).

test(holy_saturday) :-
    liturgical:date('holy_saturday', _, 2026, 4, 4, _, _, _, _).

test(saint_joseph) :-
    % March 19 falls on Thursday in 2026, transferred to Sunday March 22
    liturgical:date('saint_joseph_husband_of_mary', _, 2026, 3, 22, true, _, _, _).

test(annunciation) :-
    % March 25 - not in Holy Week/Easter Octave in 2026
    liturgical:date('the_annunciation_of_the_lord', _, 2026, 3, 25, true, _, _, _).

:- end_tests(lent_2026).

:- begin_tests(easter_2026).

test(easter_sunday) :-
    liturgical:date('easter_sunday_of_the_lords_resurrection', _, 2026, 4, 5, true, _, _, _).

test(divine_mercy_sunday) :-
    liturgical:date('second_sunday_of_easter', _, 2026, 4, 12, _, _, _, _).

test(ascension) :-
    % Transferred to Sunday (7th Sunday of Easter) = May 17
    liturgical:date('ascension_of_the_lord', _, 2026, 5, 17, true, _, _, _).

:- end_tests(easter_2026).

:- begin_tests(pentecost_2026).

test(pentecost_sunday) :-
    liturgical:date('pentecost_sunday', _, 2026, 5, 24, true, _, _, _).

test(holy_trinity) :-
    % Sunday after Pentecost = May 31
    liturgical:date('the_most_holy_trinity', _, 2026, 5, 31, true, _, _, _).

test(corpus_christi) :-
    % Sunday after Trinity (transferred) = June 7
    liturgical:date('the_most_holy_body_and_blood_of_christ', _, 2026, 6, 7, true, _, _, _).

test(sacred_heart) :-
    % Friday after 2nd Sunday after Pentecost = June 12
    liturgical:date('the_most_sacred_heart_of_jesus', _, 2026, 6, 12, true, _, _, _).

test(immaculate_heart_mary) :-
    % Saturday after Sacred Heart = June 13
    liturgical:date('the_immaculate_heart_of_the_blessed_virgin_mary', _, 2026, 6, 13, _, true, _, _).

test(mary_mother_of_church) :-
    % Monday after Pentecost = May 25
    liturgical:date('the_blessed_virgin_mary_mother_of_the_church', _, 2026, 5, 25, _, true, _, _).

test(eternal_high_priest) :-
    % Thursday after Pentecost = May 28
    liturgical:date('our_lord_jesus_christ_the_eternal_high_priest', _, 2026, 5, 28, _, _, _, _).

:- end_tests(pentecost_2026).

:- begin_tests(ordinary_time_2026).

test(christ_the_king) :-
    % Last Sunday before Advent = November 22, 2026
    liturgical:date('our_lord_jesus_christ_king_of_the_universe', _, 2026, 11, 22, true, _, _, _).

:- end_tests(ordinary_time_2026).

:- begin_tests(static_solemnities_2026).

test(christmas_2026) :-
    liturgical:date('the_nativity_of_the_lord_christmas', _, 2026, 12, 25, true, _, _, _).

test(assumption) :-
    liturgical:date('the_assumption_of_the_blessed_virgin_mary', _, 2026, 8, 15, true, _, _, _).

test(all_saints) :-
    liturgical:date('all_saints', _, 2026, 11, 1, true, _, _, _).

test(immaculate_conception) :-
    liturgical:date('the_immaculate_conception_of_the_blessed_virgin_mary', _, 2026, 12, 8, true, _, _, _).

:- end_tests(static_solemnities_2026).

:- begin_tests(static_feasts_2026).

test(presentation_of_lord) :-
    % Listed in static.pl as false, false (neither solemnity nor feast)
    liturgical:date('the_presentation_of_the_lord', _, 2026, 2, 2, false, false, _, _).

test(chair_of_peter) :-
    % Listed in static.pl as false, false
    liturgical:date('the_chair_of_saint_peter_apostle', _, 2026, 2, 22, false, false, _, _).

test(birth_of_john_baptist) :-
    liturgical:date('the_nativity_of_saint_john_the_baptist', _, 2026, 6, 24, true, _, _, _).

test(peter_and_paul) :-
    liturgical:date('saint_peter_and_saint_paul_apostles', _, 2026, 6, 29, true, _, _, _).

test(transfiguration) :-
    % Listed as false, false in static.pl
    liturgical:date('the_transfiguration_of_the_lord', _, 2026, 8, 6, false, false, _, _).

test(exaltation_of_cross) :-
    % Listed as false, false in static.pl
    liturgical:date('the_exaltation_of_the_holy_cross', _, 2026, 9, 14, false, false, _, _).

test(all_souls) :-
    liturgical:date('the_commemoration_of_all_the_faithful_departed_all_souls_day', _, 2026, 11, 2, _, _, _, _).

test(dedication_of_lateran) :-
    % Listed as false, false in static.pl
    liturgical:date('the_dedication_of_the_lateran_basilica_in_rome', _, 2026, 11, 9, false, false, _, _).

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
    liturgical:date('saint_stephen_first_martyr', _, 2026, 12, 26, false, false, _, _).

test(saint_john_apostle) :-
    % Listed as false, false in static.pl
    liturgical:date('saint_john_apostle_and_evangelist', _, 2026, 12, 27, false, false, _, _).

test(holy_innocents) :-
    % Listed as false, false in static.pl
    liturgical:date('the_holy_innocents_martyrs', _, 2026, 12, 28, false, false, _, _).

test(saint_patrick) :-
    liturgical:date('saint_patrick_bishop', _, 2026, 3, 17, _, _, _, _).

test(saint_mark) :-
    % Listed as false, false in static.pl
    liturgical:date('saint_mark_evangelist', _, 2026, 4, 25, false, false, _, _).

test(saint_matthias) :-
    % Listed as false, false in static.pl
    liturgical:date('saint_matthias_apostle', _, 2026, 5, 14, false, false, _, _).

test(visitation) :-
    % Listed as false, false in static.pl
    liturgical:date('the_visitation_of_the_blessed_virgin_mary', _, 2026, 5, 31, false, false, _, _).

test(saint_thomas_apostle) :-
    % Listed as false, false in static.pl
    liturgical:date('saint_thomas_apostle', _, 2026, 7, 3, false, false, _, _).

test(saint_james_apostle) :-
    % Listed as false, false in static.pl
    liturgical:date('saint_james_apostle', _, 2026, 7, 25, false, false, _, _).

test(saint_bartholomew) :-
    % Listed as false, false in static.pl
    liturgical:date('saint_bartholomew_apostle', _, 2026, 8, 24, false, false, _, _).

test(saint_matthew) :-
    % Listed as false, false in static.pl
    liturgical:date('saint_matthew_apostle_and_evangelist', _, 2026, 9, 21, false, false, _, _).

test(saints_michael_gabriel_raphael) :-
    % Listed as false, false in static.pl
    liturgical:date('saint_michael_saint_gabriel_and_saint_raphael_archangels', _, 2026, 9, 29, false, false, _, _).

test(saint_luke) :-
    % Listed as false, false in static.pl
    liturgical:date('saint_luke_evangelist', _, 2026, 10, 18, false, false, _, _).

test(saints_simon_and_jude) :-
    % Listed as false, false in static.pl
    liturgical:date('saint_simon_and_saint_jude_apostles', _, 2026, 10, 28, false, false, _, _).

test(saint_andrew) :-
    % Listed as false, false in static.pl
    liturgical:date('saint_andrew_apostle', _, 2026, 11, 30, false, false, _, _).

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
