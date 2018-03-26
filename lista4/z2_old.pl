% dom(Mieszkaniec, Kolor, Papierosy, Napój, Zwierzę)

mieszkaniec(anglik).
mieszkaniec(norweg).
mieszkaniec(szwed).
mieszkaniec(dunczyk).
mieszkaniec(niemiec).

kolor(czerwony).
kolor(niebieski).
kolor(zolty).
kolor(bialy).
kolor(zielony).

papierosy(fajka).
papierosy(mentolowe).
papierosy(light).
papierosy(cygara).
papierosy(bez_filtra).

napoj(kawa).
napoj(herbata).
napoj(piwo).
napoj(woda).
napoj(mleko).

zwierze(koty).
zwierze(ptaki).
zwierze(pies).
zwierze(rybki).
zwierze(konie).

generuj_dom(dom(M, K, P, N, Z)) :-
    mieszkaniec(M),
    kolor(K),
    papierosy(P),
    napoj(N),
    zwierze(Z).

% ruleX([D1, D2, D3, D4, D5])
% dom(_, _, _, _, _)

rule1([D1|_]) :- D1 = dom(norweg, _, _, _, _).

rule2(Domy) :-
    select(D, Domy, _),
    D = dom(anglik, czerwony, _, _, _).

rule3([DK,DL|_]) :-
    DK = dom(_, zielony, _, _, _),
    DL = dom(_, bialy, _, _, _).
rule3([_|T]) :- rule3(T). 

rule4(Domy) :-
    select(D, Domy, _),
    D = dom(dunczyk, _, _, herbata, _).

rule5([DK,DL|_]) :-
    DK = dom(_, _, light, _, _),
    DL = dom(_, _, _, _, koty).
rule5([DK,DL|_]) :-
    DK = dom(_, _, _, _, koty),
    DL = dom(_, _, light, _, _).
rule5([_|T]) :- rule5(T).

rule6(Domy) :-
    select(D, Domy, _),
    D = dom(_, zolty, cygara, _, _).

rule7(Domy) :-
    select(D, Domy, _),
    D = dom(niemiec, _, fajka, _, _).

rule8([_, _, D3| _]) :-
    D3 = dom(_, _, _, mleko, _).

rule9([DK, DL|_]) :-
    DK = dom(_, _, light, _, _),
    DL = dom(_, _, _, woda, _).
rule9([DK, DL|_]) :-
    DK = dom(_, _, _, woda, _),
    DL = dom(_, _, light, _, _).
rule9([_|T]) :- rule9(T).

rule10(Domy) :-
    select(D, Domy, _),
    D = dom(_, _, bez_filtra, _, ptaki).

rule11(Domy) :-
    select(D, Domy, _),
    D = dom(szwed, _, _, _, psy).

rule12([_, D2|_]) :-
    D2 = dom(_, niebieski, _, _, _).

rule13([DK, DL|_]) :-
    DK = dom(_, _, _, _, konie),
    DL = dom(_, zolty, _, _, _).
rule13([DK, DL|_]) :-
    DK = dom(_, zolty, _, _, _),
    DL = dom(_, _, _, _, konie).
rule13([_|T]) :- rule13(T).

rule14(Domy) :-
    select(D, Domy, _),
    D = dom(_, _, mentolowe, piwo, _).

rule15(Domy) :-
    select(D, Domy, _),
    D = dom(_, zielony, _, kawa, _).

einstein(L) :-
    lista_domow(L),
    rule1(L),
    apply_rules(L).
     
lista_domow([D1, D2, D3, D4, D5]) :-
    generuj_dom(D1), 
    generuj_dom(D2), 
    generuj_dom(D3), 
    generuj_dom(D4), 
    generuj_dom(D5).
        
apply_rules(L) :-
    rule1(L),
    rule12(L),
    rule8(L),
    rule3(L),
    rule15(L),
    rule2(L),
    rule6(L),
    rule13(L),
    rule9(L),
    rule7(L),
    rule10(L),
    rule4(L),
    rule11(L),
    rule5(L),
    rule14(L).