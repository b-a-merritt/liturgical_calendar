:- module(transfer, [transferable/2]).

:- use_module(constants).

% transferable/2
% transferable(date_id, boolean).

transferable(ID, false) :- constants:the_epiphany_of_the_lord(ID).
transferable(ID, true) :- constants:saint_joseph_husband_of_mary(ID).
transferable(ID, true) :- constants:the_most_holy_body_and_blood_of_christ(ID).
transferable(ID, true) :- constants:ascension_of_the_lord(ID).
transferable(ID, true) :- constants:the_immaculate_conception_of_the_blessed_virgin_mary(ID).