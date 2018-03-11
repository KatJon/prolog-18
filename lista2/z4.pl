has(ala, kot).
has(adam, pies).
has(jurek, owoc).

% z ~= 0
% t(z) ~= 1
% itd.

gives(t(z), ala, kot, adam).
gives(t(t(z)), adam, pies, ala).
gives(t(t(t(z))), jurek, owoc, adam).

is_moment(z).
is_moment(t(T)) :- is_moment(T).

moment_to_nat(T, Nat) :-
    moment_to_nat(T, 0, Nat).

moment_to_nat(z, Acc, Acc).
moment_to_nat(t(T), Acc, Nat) :-
    Next is Acc + 1,
    moment_to_nat(T, Next, Nat).

has(z, Kto, Co) :- has(Kto, Co).

has(t(T), Kto, Co) :-
    has(T, Kto, Co),
    \+ gives(t(T), Kto, Co, _).

has(t(T), Kto, Co) :-
    gives(t(T), Inny, Co, Kto),
    has(T, Inny, Co).

has_q(Nat, X, Y) :-
    moment_to_nat(T, Nat),
    has(T, X, Y).
