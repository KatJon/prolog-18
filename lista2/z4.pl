ma(ala, kot).
ma(adam, pies).
ma(jurek, owoc).

daje(1, ala, kot, adam).
daje(2, adam, pies, ala).
daje(3, jurek, pies, adam).

has(0, Kto, Co) :- ma(Kto, Co).
has(T, Kto, Co) :-
    number(T),
    T > 0,
    T1 is T - 1,
    has(T1, Kto, Co), 
    \+ daje(T, Kto, Co, _).
has(T, Kto, Co) :-
    number(T),
    T > 0,
    T1 is T - 1,
    has(T1, Inny, Co),
    daje(T, Inny, Co, Kto).

max_daje(T) :-
    daje(T, _, _, _),
    \+ (
        daje(T1, _, _, _),
        T1 > T    
    ).

ma(T, X, Y) :-
    max_daje(MaxT),
    between(0, MaxT, T),
    has(T, X, Y).
    