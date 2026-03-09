:- module(static, []).

:- use_module(constants).
:- multifile liturgical:date/9.

% date/9
% date(date_id, name, year, month, day, is_solemnity, is_feast, is_optional_memorial, is_optional_commemoration).

liturgical:date(ID,'The Blessed Virgin Mary, the Mother of God', _, 1, 1, true, false, false, false) :-
    constants:the_blessed_virgin_mary_the_mother_of_god(ID).
liturgical:date(ID,'Saint Basil the Great and Saint Gregory Nazianzen, bishops and doctors of the Church', _, 1, 2, false, true, false, false) :-
    constants:saint_basil_the_great_and_saint_gregory_nazianzen_bishops_and_doctors_of_the_church(ID).
liturgical:date(ID,'The Most Holy Name of Jesus', _, 1, 3, false, false, true, false) :-
    constants:the_most_holy_name_of_jesus(ID).
liturgical:date(ID,'Blessed Marcelina Darowska, religious', _, 1, 5, false, false, true, false) :-
    constants:blessed_marcelina_darowska_religious(ID).
liturgical:date(ID,'Saint Raymond of Penyafort, priest', _, 1, 7, false, false, true, false) :-
    constants:saint_raymond_of_penyafort_priest(ID).
liturgical:date(ID,'Saint Hilary, bishop and doctor of the Church', _, 1, 13, false, false, true, false) :-
    constants:saint_hilary_bishop_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Anthony, abbot', _, 1, 17, false, true, false, false) :-
    constants:saint_anthony_abbot(ID).
liturgical:date(ID,'Saint Fabian, pope and martyr', _, 1, 20, false, false, true, false) :-
    constants:saint_fabian_pope_and_martyr(ID).
liturgical:date(ID,'Saint Sebastian, martyr', _, 1, 20, false, false, true, false) :-
    constants:saint_sebastian_martyr(ID).
liturgical:date(ID,'Saint Agnes, virgin and martyr', _, 1, 21, false, true, false, false) :-
    constants:saint_agnes_virgin_and_martyr(ID).
liturgical:date(ID,'Saint Vincent, deacon and martyr', _, 1, 22, false, false, true, false) :-
    constants:saint_vincent_deacon_and_martyr(ID).
liturgical:date(ID,'Saint Francis de Sales, bishop and doctor of the Church', _, 1, 24, false, true, false, false) :-
    constants:saint_francis_de_sales_bishop_and_doctor_of_the_church(ID).
liturgical:date(ID,'The Conversion of Saint Paul, apostle', _, 1, 25, false, false, false, false) :-
    constants:the_conversion_of_saint_paul_apostle(ID).
liturgical:date(ID,'Saint Timothy and Saint Titus, bishops', _, 1, 26, false, true, false, false) :-
    constants:saint_timothy_and_saint_titus_bishops(ID).
liturgical:date(ID,'Saint Angela Merici, virgin', _, 1, 27, false, false, true, false) :-
    constants:saint_angela_merici_virgin(ID).
liturgical:date(ID,'Saint Thomas Aquinas, priest and doctor of the Church', _, 1, 28, false, true, false, false) :-
    constants:saint_thomas_aquinas_priest_and_doctor_of_the_church(ID).
liturgical:date(ID,'Blessed Bronislaw Markiewicz, priest', _, 1, 30, false, false, true, false) :-
    constants:blessed_bronislaw_markiewicz_priest(ID).
liturgical:date(ID,'Saint John Bosco, priest', _, 1, 31, false, true, false, false) :-
    constants:saint_john_bosco_priest(ID).
liturgical:date(ID,'The Presentation of the Lord', _, 2, 2, false, false, false, false) :-
    constants:the_presentation_of_the_lord(ID).
liturgical:date(ID,'Saint Ansgar, bishop', _, 2, 3, false, false, true, false) :-
    constants:saint_ansgar_bishop(ID).
liturgical:date(ID,'Saint Blase, bishop and martyr', _, 2, 3, false, false, true, false) :-
    constants:saint_blase_bishop_and_martyr(ID).
liturgical:date(ID,'Saint Agatha, virgin and martyr', _, 2, 5, false, true, false, false) :-
    constants:saint_agatha_virgin_and_martyr(ID).
liturgical:date(ID,'Saint Paul Miki and companions, martyrs', _, 2, 6, false, true, false, false) :-
    constants:saint_paul_miki_and_companions_martyrs(ID).
liturgical:date(ID,'Saint Jerome Emiliani', _, 2, 8, false, false, true, false) :-
    constants:saint_jerome_emiliani(ID).
liturgical:date(ID,'Saint Josephine Bakhita, virgin', _, 2, 8, false, false, true, false) :-
    constants:saint_josephine_bakhita_virgin(ID).
liturgical:date(ID,'Saint Scholastica, virgin', _, 2, 10, false, true, false, false) :-
    constants:saint_scholastica_virgin(ID).
liturgical:date(ID,'Our Lady of Lourdes', _, 2, 11, false, false, true, false) :-
    constants:our_lady_of_lourdes(ID).
liturgical:date(ID,'Saint Cyril, monk, and Saint Methodius, bishop', _, 2, 14, false, false, false, false) :-
    constants:saint_cyril_monk_and_saint_methodius_bishop(ID).
liturgical:date(ID,'The Seven Founders of the Order of Servites, religious', _, 2, 17, false, false, true, false) :-
    constants:the_seven_founders_of_the_order_of_servites_religious(ID).
liturgical:date(ID,'Saint Peter Damian, bishop and doctor of the Church', _, 2, 21, false, false, true, false) :-
    constants:saint_peter_damian_bishop_and_doctor_of_the_church(ID).
liturgical:date(ID,'The Chair of Saint Peter, apostle', _, 2, 22, false, false, false, false) :-
    constants:the_chair_of_saint_peter_apostle(ID).
liturgical:date(ID,'Saint Polycarp, bishop and martyr', _, 2, 23, false, false, false, true) :-
    constants:saint_polycarp_bishop_and_martyr(ID).
liturgical:date(ID,'Saint Gregory of Narek, abbot and doctor of the Church', _, 2, 27, false, false, false, true) :-
    constants:saint_gregory_of_narek_abbot_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Casimir', _, 3, 4, false, false, false, true) :-
    constants:saint_casimir(ID).
liturgical:date(ID,'Saint Perpetua and Saint Felicity, martyrs', _, 3, 7, false, false, false, true) :-
    constants:saint_perpetua_and_saint_felicity_martyrs(ID).
liturgical:date(ID,'Saint John of God, religious', _, 3, 8, false, false, false, true) :-
    constants:saint_john_of_god_religious(ID).
liturgical:date(ID,'Saint Frances of Rome, religious', _, 3, 9, false, false, false, true) :-
    constants:saint_frances_of_rome_religious(ID).
liturgical:date(ID,'Saint Patrick, bishop', _, 3, 17, false, false, false, true) :-
    constants:saint_patrick_bishop(ID).
liturgical:date(ID,'Saint Cyril of Jerusalem, bishop and doctor of the Church', _, 3, 18, false, false, false, true) :-
    constants:saint_cyril_of_jerusalem_bishop_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Turibius de Mongrovejo, bishop', _, 3, 23, false, false, false, true) :-
    constants:saint_turibius_de_mongrovejo_bishop(ID).
liturgical:date(ID,'Our Lady of Mercy', _, 4, 1, false, false, false, true) :-
    constants:our_lady_of_mercy(ID).
liturgical:date(ID,'Saint Francis of Paola, hermit', _, 4, 2, false, false, false, true) :-
    constants:saint_francis_of_paola_hermit(ID).
liturgical:date(ID,'Saint Isidore, bishop and doctor of the Church', _, 4, 4, false, false, false, true) :-
    constants:saint_isidore_bishop_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Vincent Ferrer, priest', _, 4, 5, false, false, false, true) :-
    constants:saint_vincent_ferrer_priest(ID).
liturgical:date(ID,'Saint John Baptist de la Salle, priest', _, 4, 7, false, false, false, true) :-
    constants:saint_john_baptist_de_la_salle_priest(ID).
liturgical:date(ID,'Saint Martin I, pope and martyr', _, 4, 13, false, false, true, false) :-
    constants:saint_martin_i_pope_and_martyr(ID).
liturgical:date(ID,'Saint Anselm, bishop and doctor of the Church', _, 4, 21, false, false, true, false) :-
    constants:saint_anselm_bishop_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Adalbert, bishop and martyr', _, 4, 23, false, false, true, false) :-
    constants:saint_adalbert_bishop_and_martyr(ID).
liturgical:date(ID,'Saint George, martyr', _, 4, 23, false, false, true, false) :-
    constants:saint_george_martyr(ID).
liturgical:date(ID,'Saint Fidelis of Sigmaringen, priest and martyr', _, 4, 24, false, false, true, false) :-
    constants:saint_fidelis_of_sigmaringen_priest_and_martyr(ID).
liturgical:date(ID,'Saint Mark, evangelist', _, 4, 25, false, false, false, false) :-
    constants:saint_mark_evangelist(ID).
liturgical:date(ID,'Saint Louis Grignion de Montfort, priest', _, 4, 28, false, false, true, false) :-
    constants:saint_louis_grignion_de_montfort_priest(ID).
liturgical:date(ID,'Saint Peter Chanel, priest and martyr', _, 4, 28, false, false, true, false) :-
    constants:saint_peter_chanel_priest_and_martyr(ID).
liturgical:date(ID,'Saint Catherine of Siena, virgin and doctor of the Church', _, 4, 29, false, false, false, false) :-
    constants:saint_catherine_of_siena_virgin_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Pius V, pope', _, 4, 30, false, false, true, false) :-
    constants:saint_pius_v_pope(ID).
liturgical:date(ID,'Saint Joseph the Worker', _, 5, 1, false, false, true, false) :-
    constants:saint_joseph_the_worker(ID).
liturgical:date(ID,'Saint Athanasius, bishop and doctor of the Church', _, 5, 2, false, true, false, false) :-
    constants:saint_athanasius_bishop_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Philip and Saint James, apostles', _, 5, 3, false, false, false, false) :-
    constants:saint_philip_and_saint_james_apostles(ID).
liturgical:date(ID,'Saint Stanislaus, bishop and martyr', _, 5, 8, false, true, false, false) :-
    constants:saint_stanislaus_bishop_and_martyr(ID).
liturgical:date(ID,'Saint John of Avila, priest and doctor of the Church', _, 5, 10, false, false, true, false) :-
    constants:saint_john_of_avila_priest_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Nereus and Saint Achilleus, martyrs', _, 5, 12, false, false, true, false) :-
    constants:saint_nereus_and_saint_achilleus_martyrs(ID).
liturgical:date(ID,'Saint Pancras, martyr', _, 5, 12, false, false, true, false) :-
    constants:saint_pancras_martyr(ID).
liturgical:date(ID,'Our Lady of Fatima', _, 5, 13, false, false, true, false) :-
    constants:our_lady_of_fatima(ID).
liturgical:date(ID,'Saint Matthias, apostle', _, 5, 14, false, false, false, false) :-
    constants:saint_matthias_apostle(ID).
liturgical:date(ID,'Saint Andrzej Bobola, priest and martyr', _, 5, 16, false, false, true, false) :-
    constants:saint_andrzej_bobola_priest_and_martyr(ID).
liturgical:date(ID,'Saint John I, pope and martyr', _, 5, 18, false, false, true, false) :-
    constants:saint_john_i_pope_and_martyr(ID).
liturgical:date(ID,'Saint Bernardine of Siena, priest', _, 5, 20, false, false, true, false) :-
    constants:saint_bernardine_of_siena_priest(ID).
liturgical:date(ID,'Saint Christopher Magallanes, priest, and companions, martyrs', _, 5, 21, false, false, true, false) :-
    constants:saint_christopher_magallanes_priest_and_companions_martyrs(ID).
liturgical:date(ID,'Saint John of Nepomuk, priest and martyr', _, 5, 21, false, false, true, false) :-
    constants:saint_john_of_nepomuk_priest_and_martyr(ID).
liturgical:date(ID,'Saint Rita of Cassia, religious', _, 5, 22, false, false, true, false) :-
    constants:saint_rita_of_cassia_religious(ID).
liturgical:date(ID,'Saint Bede the Venerable, priest and doctor of the Church', _, 5, 25, false, false, true, false) :-
    constants:saint_bede_the_venerable_priest_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Gregory VII, pope', _, 5, 25, false, false, true, false) :-
    constants:saint_gregory_vii_pope(ID).
liturgical:date(ID,'Saint Mary Magdalene de Pazzi, virgin', _, 5, 25, false, false, true, false) :-
    constants:saint_mary_magdalene_de_pazzi_virgin(ID).
liturgical:date(ID,'Saint Philip Neri, priest', _, 5, 26, false, true, false, false) :-
    constants:saint_philip_neri_priest(ID).
liturgical:date(ID,'Saint Augustine of Canterbury, bishop', _, 5, 27, false, false, true, false) :-
    constants:saint_augustine_of_canterbury_bishop(ID).
liturgical:date(ID,'Saint Paul VI, pope', _, 5, 29, false, false, true, false) :-
    constants:saint_paul_vi_pope(ID).
liturgical:date(ID,'The Visitation of the Blessed Virgin Mary', _, 5, 31, false, false, false, false) :-
    constants:the_visitation_of_the_blessed_virgin_mary(ID).
liturgical:date(ID,'Saint Justin, martyr', _, 6, 1, false, true, false, false) :-
    constants:saint_justin_martyr(ID).
liturgical:date(ID,'Saint Marcellinus and Saint Peter, martyrs', _, 6, 2, false, false, true, false) :-
    constants:saint_marcellinus_and_saint_peter_martyrs(ID).
liturgical:date(ID,'Saint Charles Lwanga and companions, martyrs', _, 6, 3, false, true, false, false) :-
    constants:saint_charles_lwanga_and_companions_martyrs(ID).
liturgical:date(ID,'Saint Boniface, bishop and martyr', _, 6, 5, false, true, false, false) :-
    constants:saint_boniface_bishop_and_martyr(ID).
liturgical:date(ID,'Saint Norbert, bishop', _, 6, 6, false, false, true, false) :-
    constants:saint_norbert_bishop(ID).
liturgical:date(ID,'Saint Ephrem, deacon and doctor of the Church', _, 6, 9, false, false, true, false) :-
    constants:saint_ephrem_deacon_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Barnabas, apostle', _, 6, 11, false, true, false, false) :-
    constants:saint_barnabas_apostle(ID).
liturgical:date(ID,'Saint Anthony of Padua, priest and doctor of the Church', _, 6, 13, false, true, false, false) :-
    constants:saint_anthony_of_padua_priest_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Albert Chmielowski, religious', _, 6, 17, false, false, true, false) :-
    constants:saint_albert_chmielowski_religious(ID).
liturgical:date(ID,'Saint Romuald, abbot', _, 6, 19, false, false, true, false) :-
    constants:saint_romuald_abbot(ID).
liturgical:date(ID,'Saint Aloysius Gonzaga, religious', _, 6, 21, false, true, false, false) :-
    constants:saint_aloysius_gonzaga_religious(ID).
liturgical:date(ID,'Saint John Fisher, bishop, and Saint Thomas More, martyrs', _, 6, 22, false, false, true, false) :-
    constants:saint_john_fisher_bishop_and_saint_thomas_more_martyrs(ID).
liturgical:date(ID,'Saint Paulinus of Nola, bishop', _, 6, 22, false, false, true, false) :-
    constants:saint_paulinus_of_nola_bishop(ID).
liturgical:date(ID,'The Nativity of Saint John the Baptist', _, 6, 24, true, false, false, false) :-
    constants:the_nativity_of_saint_john_the_baptist(ID).
liturgical:date(ID,'Saint Zygmunt Gorazdowski, priest', _, 6, 26, false, false, true, false) :-
    constants:saint_zygmunt_gorazdowski_priest(ID).
liturgical:date(ID,'Saint Cyril of Alexandria, bishop and doctor of the Church', _, 6, 27, false, false, true, false) :-
    constants:saint_cyril_of_alexandria_bishop_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Irenaeus, bishop, martyr and doctor of the Church', _, 6, 28, false, true, false, false) :-
    constants:saint_irenaeus_bishop_martyr_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Peter and Saint Paul, apostles', _, 6, 29, true, false, false, false) :-
    constants:saint_peter_and_saint_paul_apostles(ID).
liturgical:date(ID,'The First Martyrs of the Church of Rome', _, 6, 30, false, false, true, false) :-
    constants:the_first_martyrs_of_the_church_of_rome(ID).
liturgical:date(ID,'Saint Thomas, apostle', _, 7, 3, false, false, false, false) :-
    constants:saint_thomas_apostle(ID).
liturgical:date(ID,'Saint Elizabeth of Portugal', _, 7, 4, false, false, true, false) :-
    constants:saint_elizabeth_of_portugal(ID).
liturgical:date(ID,'Saint Anthony Mary Zaccaria, priest', _, 7, 5, false, false, true, false) :-
    constants:saint_anthony_mary_zaccaria_priest(ID).
liturgical:date(ID,'Saint Maria Goretti, virgin and martyr', _, 7, 6, false, false, true, false) :-
    constants:saint_maria_goretti_virgin_and_martyr(ID).
liturgical:date(ID,'Saint John of Dukla, priest', _, 7, 8, false, false, true, false) :-
    constants:saint_john_of_dukla_priest(ID).
liturgical:date(ID,'Saint Augustine Zhao Rong, priest, and companions, martyrs', _, 7, 9, false, false, true, false) :-
    constants:saint_augustine_zhao_rong_priest_and_companions_martyrs(ID).
liturgical:date(ID,'Saint Benedict, abbot', _, 7, 11, false, false, false, false) :-
    constants:saint_benedict_abbot(ID).
liturgical:date(ID,'Saint Henry', _, 7, 13, false, false, true, false) :-
    constants:saint_henry(ID).
liturgical:date(ID,'Saint Camillus de Lellis, priest', _, 7, 14, false, false, true, false) :-
    constants:saint_camillus_de_lellis_priest(ID).
liturgical:date(ID,'Saint Bonaventure, bishop and doctor of the Church', _, 7, 15, false, true, false, false) :-
    constants:saint_bonaventure_bishop_and_doctor_of_the_church(ID).
liturgical:date(ID,'Our Lady of Mount Carmel', _, 7, 16, false, false, true, false) :-
    constants:our_lady_of_mount_carmel(ID).
liturgical:date(ID,'Saint Jadwiga of Poland', _, 7, 18, false, false, true, false) :-
    constants:saint_jadwiga_of_poland(ID).
liturgical:date(ID,'Saint Apollinaris, bishop and martyr', _, 7, 20, false, false, true, false) :-
    constants:saint_apollinaris_bishop_and_martyr(ID).
liturgical:date(ID,'Saint Lawrence of Brindisi, priest and doctor of the Church', _, 7, 21, false, false, true, false) :-
    constants:saint_lawrence_of_brindisi_priest_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Mary Magdalene', _, 7, 22, false, false, false, false) :-
    constants:saint_mary_magdalene(ID).
liturgical:date(ID,'Saint Bridget, religious', _, 7, 23, false, false, false, false) :-
    constants:saint_bridget_religious(ID).
liturgical:date(ID,'Saint Olga of Kiev', _, 7, 24, false, false, true, false) :-
    constants:saint_olga_of_kiev(ID).
liturgical:date(ID,'Saint Sharbel Makhluf, priest', _, 7, 24, false, false, true, false) :-
    constants:saint_sharbel_makhluf_priest(ID).
liturgical:date(ID,'Saint James, apostle', _, 7, 25, false, false, false, false) :-
    constants:saint_james_apostle(ID).
liturgical:date(ID,'Saint Joachim and Saint Anne, parents of the Blessed Virgin Mary', _, 7, 26, false, true, false, false) :-
    constants:saint_joachim_and_saint_anne_parents_of_the_blessed_virgin_mary(ID).
liturgical:date(ID,'Saint Vladimir', _, 7, 28, false, true, false, false) :-
    constants:saint_vladimir(ID).
liturgical:date(ID,'Saint Martha, Saint Mary and Saint Lazarus', _, 7, 29, false, true, false, false) :-
    constants:saint_martha_saint_mary_and_saint_lazarus(ID).
liturgical:date(ID,'Saint Peter Chrysologus, bishop and doctor of the Church', _, 7, 30, false, false, true, false) :-
    constants:saint_peter_chrysologus_bishop_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Ignatius of Loyola, priest', _, 7, 31, false, true, false, false) :-
    constants:saint_ignatius_of_loyola_priest(ID).
liturgical:date(ID,'Saint Alphonsus Liguori, bishop and doctor of the Church', _, 8, 1, false, true, false, false) :-
    constants:saint_alphonsus_liguori_bishop_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Eusebius of Vercelli, bishop', _, 8, 2, false, false, true, false) :-
    constants:saint_eusebius_of_vercelli_bishop(ID).
liturgical:date(ID,'Saint Peter Julian Eymard, priest', _, 8, 2, false, false, true, false) :-
    constants:saint_peter_julian_eymard_priest(ID).
liturgical:date(ID,'Saint John Vianney, priest', _, 8, 4, false, true, false, false) :-
    constants:saint_john_vianney_priest(ID).
liturgical:date(ID,'The Dedication of the Basilica of Saint Mary Major in Rome', _, 8, 5, false, false, true, false) :-
    constants:the_dedication_of_the_basilica_of_saint_mary_major_in_rome(ID).
liturgical:date(ID,'The Transfiguration of the Lord', _, 8, 6, false, false, false, false) :-
    constants:the_transfiguration_of_the_lord(ID).
liturgical:date(ID,'Saint Cajetan, priest', _, 8, 7, false, false, true, false) :-
    constants:saint_cajetan_priest(ID).
liturgical:date(ID,'Saint Sixtus II, pope, and companions, martyrs', _, 8, 7, false, false, true, false) :-
    constants:saint_sixtus_ii_pope_and_companions_martyrs(ID).
liturgical:date(ID,'Saint Dominic, priest', _, 8, 8, false, true, false, false) :-
    constants:saint_dominic_priest(ID).
liturgical:date(ID,'Saint Teresa Benedicta of the Cross, virgin and martyr', _, 8, 9, false, false, false, false) :-
    constants:saint_teresa_benedicta_of_the_cross_virgin_and_martyr(ID).
liturgical:date(ID,'Saint Lawrence, deacon and martyr', _, 8, 10, false, false, false, false) :-
    constants:saint_lawrence_deacon_and_martyr(ID).
liturgical:date(ID,'Saint Clare, virgin', _, 8, 11, false, true, false, false) :-
    constants:saint_clare_virgin(ID).
liturgical:date(ID,'Saint Jane Frances de Chantal, religious', _, 8, 12, false, false, true, false) :-
    constants:saint_jane_frances_de_chantal_religious(ID).
liturgical:date(ID,'Saint Pontian, pope, and Saint Hippolytus, priest, martyrs', _, 8, 13, false, false, true, false) :-
    constants:saint_pontian_pope_and_saint_hippolytus_priest_martyrs(ID).
liturgical:date(ID,'Saint Maximilian Kolbe, priest and martyr', _, 8, 14, false, true, false, false) :-
    constants:saint_maximilian_kolbe_priest_and_martyr(ID).
liturgical:date(ID,'The Assumption of the Blessed Virgin Mary', _, 8, 15, true, false, false, false) :-
    constants:the_assumption_of_the_blessed_virgin_mary(ID).
liturgical:date(ID,'Saint Stephen of Hungary', _, 8, 16, false, false, true, false) :-
    constants:saint_stephen_of_hungary(ID).
liturgical:date(ID,'Saint Hyacinth of Poland, priest', _, 8, 17, false, false, true, false) :-
    constants:saint_hyacinth_of_poland_priest(ID).
liturgical:date(ID,'Saint John Eudes, priest', _, 8, 19, false, false, true, false) :-
    constants:saint_john_eudes_priest(ID).
liturgical:date(ID,'Saint Bernard, abbot and doctor of the Church', _, 8, 20, false, true, false, false) :-
    constants:saint_bernard_abbot_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Pius X, pope', _, 8, 21, false, true, false, false) :-
    constants:saint_pius_x_pope(ID).
liturgical:date(ID,'The Queenship of the Blessed Virgin Mary', _, 8, 22, false, true, false, false) :-
    constants:the_queenship_of_the_blessed_virgin_mary(ID).
liturgical:date(ID,'Saint Rose of Lima, virgin', _, 8, 23, false, false, true, false) :-
    constants:saint_rose_of_lima_virgin(ID).
liturgical:date(ID,'Saint Bartholomew, apostle', _, 8, 24, false, false, false, false) :-
    constants:saint_bartholomew_apostle(ID).
liturgical:date(ID,'Saint Joseph Calasanz, priest', _, 8, 25, false, false, true, false) :-
    constants:saint_joseph_calasanz_priest(ID).
liturgical:date(ID,'Saint Louis', _, 8, 25, false, false, true, false) :-
    constants:saint_louis(ID).
liturgical:date(ID,'Our Lady of Czestochowa', _, 8, 26, false, false, true, false) :-
    constants:our_lady_of_czestochowa(ID).
liturgical:date(ID,'Saint Monica', _, 8, 27, false, true, false, false) :-
    constants:saint_monica(ID).
liturgical:date(ID,'Saint Augustine, bishop and doctor of the Church', _, 8, 28, false, true, false, false) :-
    constants:saint_augustine_bishop_and_doctor_of_the_church(ID).
liturgical:date(ID,'The Passion of Saint John the Baptist, martyr', _, 8, 29, false, true, false, false) :-
    constants:the_passion_of_saint_john_the_baptist_martyr(ID).
liturgical:date(ID,'Saint Gregory the Great, pope and doctor of the Church', _, 9, 3, false, true, false, false) :-
    constants:saint_gregory_the_great_pope_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Teresa of Calcutta, virgin', _, 9, 5, false, false, true, false) :-
    constants:saint_teresa_of_calcutta_virgin(ID).
liturgical:date(ID,'The Nativity of the Blessed Virgin Mary', _, 9, 8, false, false, false, false) :-
    constants:the_nativity_of_the_blessed_virgin_mary(ID).
liturgical:date(ID,'Blessed Wladyslaw Bladzinski, priest, and companions, martyrs', _, 9, 9, false, false, true, false) :-
    constants:blessed_wladyslaw_bladzinski_priest_and_companions_martyrs(ID).
liturgical:date(ID,'Saint Peter Claver, priest', _, 9, 9, false, false, true, false) :-
    constants:saint_peter_claver_priest(ID).
liturgical:date(ID,'The Most Holy Name of Mary', _, 9, 12, false, false, true, false) :-
    constants:the_most_holy_name_of_mary(ID).
liturgical:date(ID,'Saint John Chrysostom, bishop and doctor of the Church', _, 9, 13, false, true, false, false) :-
    constants:saint_john_chrysostom_bishop_and_doctor_of_the_church(ID).
liturgical:date(ID,'The Exaltation of the Holy Cross', _, 9, 14, false, false, false, false) :-
    constants:the_exaltation_of_the_holy_cross(ID).
liturgical:date(ID,'Our Lady of Sorrows', _, 9, 15, false, true, false, false) :-
    constants:our_lady_of_sorrows(ID).
liturgical:date(ID,'Saint Cornelius, pope, and Saint Cyprian, bishop, martyrs', _, 9, 16, false, true, false, false) :-
    constants:saint_cornelius_pope_and_saint_cyprian_bishop_martyrs(ID).
liturgical:date(ID,'Saint Hildegard of Bingen, virgin and doctor of the Church', _, 9, 17, false, false, true, false) :-
    constants:saint_hildegard_of_bingen_virgin_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Robert Bellarmine, bishop and doctor of the Church', _, 9, 17, false, false, true, false) :-
    constants:saint_robert_bellarmine_bishop_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Stanislaus Kostka, religious', _, 9, 18, false, true, false, false) :-
    constants:saint_stanislaus_kostka_religious(ID).
liturgical:date(ID,'Saint Januarius, bishop and martyr', _, 9, 19, false, false, true, false) :-
    constants:saint_januarius_bishop_and_martyr(ID).
liturgical:date(ID,'Saint Andrew Kim Taegon, priest, Saint Paul Chong Hasang and companions, martyrs', _, 9, 20, false, true, false, false) :-
    constants:saint_andrew_kim_taegon_priest_saint_paul_chong_hasang_and_companions_martyrs(ID).
liturgical:date(ID,'Saint Matthew, apostle and evangelist', _, 9, 21, false, false, false, false) :-
    constants:saint_matthew_apostle_and_evangelist(ID).
liturgical:date(ID,'Saint Pius of Pietrelcina, priest', _, 9, 23, false, true, false, false) :-
    constants:saint_pius_of_pietrelcina_priest(ID).
liturgical:date(ID,'Saint Cosmas and Saint Damian, martyrs', _, 9, 26, false, false, true, false) :-
    constants:saint_cosmas_and_saint_damian_martyrs(ID).
liturgical:date(ID,'Saint Vincent de Paul, priest', _, 9, 27, false, true, false, false) :-
    constants:saint_vincent_de_paul_priest(ID).
liturgical:date(ID,'Saint Lawrence Ruiz and companions, martyrs', _, 9, 28, false, false, true, false) :-
    constants:saint_lawrence_ruiz_and_companions_martyrs(ID).
liturgical:date(ID,'Saint Wenceslaus, martyr', _, 9, 28, false, false, true, false) :-
    constants:saint_wenceslaus_martyr(ID).
liturgical:date(ID,'Saint Michael, Saint Gabriel, and Saint Raphael, archangels', _, 9, 29, false, false, false, false) :-
    constants:saint_michael_saint_gabriel_and_saint_raphael_archangels(ID).
liturgical:date(ID,'Saint Jerome, priest and doctor of the Church', _, 9, 30, false, true, false, false) :-
    constants:saint_jerome_priest_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Therese of the Child Jesus, virgin and doctor of the Church', _, 10, 1, false, true, false, false) :-
    constants:saint_therese_of_the_child_jesus_virgin_and_doctor_of_the_church(ID).
liturgical:date(ID,'The Holy Guardian Angels', _, 10, 2, false, true, false, false) :-
    constants:the_holy_guardian_angels(ID).
liturgical:date(ID,'Saint Francis of Assisi, religious', _, 10, 4, false, true, false, false) :-
    constants:saint_francis_of_assisi_religious(ID).
liturgical:date(ID,'Saint Faustina Kowalska, virgin', _, 10, 5, false, false, true, false) :-
    constants:saint_faustina_kowalska_virgin(ID).
liturgical:date(ID,'Saint Bruno, priest', _, 10, 6, false, false, true, false) :-
    constants:saint_bruno_priest(ID).
liturgical:date(ID,'Our Lady of the Rosary', _, 10, 7, false, true, false, false) :-
    constants:our_lady_of_the_rosary(ID).
liturgical:date(ID,'Saint Denis, bishop, and companions, martyrs', _, 10, 9, false, false, true, false) :-
    constants:saint_denis_bishop_and_companions_martyrs(ID).
liturgical:date(ID,'Saint John Leonardi, priest', _, 10, 9, false, false, true, false) :-
    constants:saint_john_leonardi_priest(ID).
liturgical:date(ID,'Saint John XXIII, pope', _, 10, 11, false, false, true, false) :-
    constants:saint_john_xxiii_pope(ID).
liturgical:date(ID,'Saint Callistus I, pope and martyr', _, 10, 14, false, false, true, false) :-
    constants:saint_callistus_i_pope_and_martyr(ID).
liturgical:date(ID,'Saint Teresa of Jesus, virgin and doctor of the Church', _, 10, 15, false, true, false, false) :-
    constants:saint_teresa_of_jesus_virgin_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Hedwig, religious', _, 10, 16, false, false, true, false) :-
    constants:saint_hedwig_religious(ID).
liturgical:date(ID,'Saint Margaret Mary Alacoque, virgin', _, 10, 16, false, false, true, false) :-
    constants:saint_margaret_mary_alacoque_virgin(ID).
liturgical:date(ID,'Saint Ignatius of Antioch, bishop and martyr', _, 10, 17, false, true, false, false) :-
    constants:saint_ignatius_of_antioch_bishop_and_martyr(ID).
liturgical:date(ID,'Saint Luke, evangelist', _, 10, 18, false, false, false, false) :-
    constants:saint_luke_evangelist(ID).
liturgical:date(ID,'Saint John de Brebeuf, Saint Isaac Jogues, priests, and companions, martyrs', _, 10, 19, false, false, true, false) :-
    constants:saint_john_de_brebeuf_saint_isaac_jogues_priests_and_companions_martyrs(ID).
liturgical:date(ID,'Saint Paul of the Cross, priest', _, 10, 19, false, false, true, false) :-
    constants:saint_paul_of_the_cross_priest(ID).
liturgical:date(ID,'Saint John Paul II, pope', _, 10, 22, false, false, true, false) :-
    constants:saint_john_paul_ii_pope(ID).
liturgical:date(ID,'Saint John of Capistrano, priest', _, 10, 22, false, false, true, false) :-
    constants:saint_john_of_capistrano_priest(ID).
liturgical:date(ID,'Saint Jozef Bilczewski, bishop', _, 10, 23, false, true, false, false) :-
    constants:saint_jozef_bilczewski_bishop(ID).
liturgical:date(ID,'Saint Anthony Mary Claret, bishop', _, 10, 24, false, false, true, false) :-
    constants:saint_anthony_mary_claret_bishop(ID).
liturgical:date(ID,'Saint Simon and Saint Jude, apostles', _, 10, 28, false, false, false, false) :-
    constants:saint_simon_and_saint_jude_apostles(ID).
liturgical:date(ID,'All Saints', _, 11, 1, true, false, false, false) :-
    constants:all_saints(ID).
liturgical:date('the_commemoration_of_all_the_faithful_departed_all_souls', 'The Commemoration of all the Faithful Departed (All Souls)', _, 11, 2, false, false, false, false).
liturgical:date(ID,'Saint Martin de Porres, religious', _, 11, 3, false, false, true, false) :-
    constants:saint_martin_de_porres_religious(ID).
liturgical:date(ID,'Saint Charles Borromeo, bishop', _, 11, 4, false, true, false, false) :-
    constants:saint_charles_borromeo_bishop(ID).
liturgical:date(ID,'The Dedication of the Lateran Basilica in Rome', _, 11, 9, false, false, false, false) :-
    constants:the_dedication_of_the_lateran_basilica_in_rome(ID).
liturgical:date(ID,'Saint Leo the Great, pope and doctor of the Church', _, 11, 10, false, true, false, false) :-
    constants:saint_leo_the_great_pope_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Martin of Tours, bishop', _, 11, 11, false, true, false, false) :-
    constants:saint_martin_of_tours_bishop(ID).
liturgical:date(ID,'Saint Josaphat, bishop and martyr', _, 11, 12, false, true, false, false) :-
    constants:saint_josaphat_bishop_and_martyr(ID).
liturgical:date(ID,'Saint Albert the Great, bishop and doctor of the Church', _, 11, 15, false, false, true, false) :-
    constants:saint_albert_the_great_bishop_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Gertrude, virgin', _, 11, 16, false, false, true, false) :-
    constants:saint_gertrude_virgin(ID).
liturgical:date(ID,'Saint Margaret of Scotland', _, 11, 16, false, false, true, false) :-
    constants:saint_margaret_of_scotland(ID).
liturgical:date(ID,'Saint Elizabeth of Hungary, religious', _, 11, 17, false, true, false, false) :-
    constants:saint_elizabeth_of_hungary_religious(ID).
liturgical:date(ID,'The Dedication of the Basilicas of Saint Peter and Saint Paul in Rome, apostles', _, 11, 18, false, false, true, false) :-
    constants:the_dedication_of_the_basilicas_of_saint_peter_and_saint_paul_in_rome_apostles(ID).
liturgical:date(ID,'The Presentation of the Blessed Virgin Mary', _, 11, 21, false, true, false, false) :-
    constants:the_presentation_of_the_blessed_virgin_mary(ID).
liturgical:date(ID,'Saint Cecilia, virgin and martyr', _, 11, 22, false, true, false, false) :-
    constants:saint_cecilia_virgin_and_martyr(ID).
liturgical:date(ID,'Saint Clement I, pope and martyr', _, 11, 23, false, false, true, false) :-
    constants:saint_clement_i_pope_and_martyr(ID).
liturgical:date(ID,'Saint Columban, abbot', _, 11, 23, false, false, true, false) :-
    constants:saint_columban_abbot(ID).
liturgical:date(ID,'Saint Andrew Dung-Lac, priest, and companions, martyrs', _, 11, 24, false, true, false, false) :-
    constants:saint_andrew_dunglac_priest_and_companions_martyrs(ID).
liturgical:date(ID,'Saint Catherine of Alexandria, virgin and martyr', _, 11, 25, false, false, true, false) :-
    constants:saint_catherine_of_alexandria_virgin_and_martyr(ID).
liturgical:date(ID,'Saint Andrew, apostle', _, 11, 30, false, false, false, false) :-
    constants:saint_andrew_apostle(ID).
liturgical:date(ID,'Saint Francis Xavier, priest', _, 12, 3, false, true, false, false) :-
    constants:saint_francis_xavier_priest(ID).
liturgical:date(ID,'Saint John Damascene, priest and doctor of the Church', _, 12, 4, false, false, true, false) :-
    constants:saint_john_damascene_priest_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Nicholas, bishop', _, 12, 6, false, false, true, false) :-
    constants:saint_nicholas_bishop(ID).
liturgical:date(ID,'Saint Ambrose, bishop and doctor of the Church', _, 12, 7, false, true, false, false) :-
    constants:saint_ambrose_bishop_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Juan Diego Cuauhtlatoatzin', _, 12, 9, false, false, true, false) :-
    constants:saint_juan_diego_cuauhtlatoatzin(ID).
liturgical:date(ID,'Our Lady of Loreto', _, 12, 10, false, false, true, false) :-
    constants:our_lady_of_loreto(ID).
liturgical:date(ID,'Saint Damasus I, pope', _, 12, 11, false, false, true, false) :-
    constants:saint_damasus_i_pope(ID).
liturgical:date(ID,'Our Lady of Guadalupe', _, 12, 12, false, false, true, false) :-
    constants:our_lady_of_guadalupe(ID).
liturgical:date(ID,'Saint Lucy, virgin and martyr', _, 12, 13, false, true, false, false) :-
    constants:saint_lucy_virgin_and_martyr(ID).
liturgical:date(ID,'Saint John of the Cross, priest and doctor of the Church', _, 12, 14, false, true, false, false) :-
    constants:saint_john_of_the_cross_priest_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint Peter Canisius, priest and doctor of the Church', _, 12, 21, false, false, false, true) :-
    constants:saint_peter_canisius_priest_and_doctor_of_the_church(ID).
liturgical:date(ID,'Saint John of Kanty, priest', _, 12, 23, false, false, false, true) :-
    constants:saint_john_of_kanty_priest(ID).
liturgical:date('the_nativity_of_the_lord_christmas', 'The Nativity of the Lord (Christmas)', _, 12, 25, true, false, false, false).
liturgical:date(ID,'Saint Stephen, first martyr', _, 12, 26, false, false, false, false) :-
    constants:saint_stephen_first_martyr(ID).
liturgical:date(ID,'Saint John, apostle and evangelist', _, 12, 27, false, false, false, false) :-
    constants:saint_john_apostle_and_evangelist(ID).
liturgical:date(ID,'The Holy Innocents, martyrs', _, 12, 28, false, false, false, false) :-
    constants:the_holy_innocents_martyrs(ID).
liturgical:date(ID,'Saint Thomas Becket, bishop and martyr', _, 12, 29, false, false, false, true) :-
    constants:saint_thomas_becket_bishop_and_martyr(ID).
liturgical:date(ID,'Saint Sylvester I, pope', _, 12, 31, false, false, false, true) :-
    constants:saint_sylvester_i_pope(ID).
