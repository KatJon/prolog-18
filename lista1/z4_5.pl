% refl
le(a, a).
le(b, b).
le(c, c).
le(d, d).
le(e, e).

% rels
le(a, b).
le(a, c).
le(b, d).
le(c, d).
le(a, e).

% trans
le(a, d).

in_poset(X) :- le(X, _).
in_poset(X) :- le(_, X).

% same as forall/2
my_forall(X, Y) :- \+ ( X, \+ Y).

lt(X, Y) :-
    le(X, Y),
    X \= Y.

maximal(X) :-
    in_poset(X),
    \+ lt(X, _).

greatest(X) :-
    in_poset(X),
    my_forall(in_poset(Y), le(Y, X)).

minimal(X) :-
    in_poset(X),
    \+ lt(_, X).

least(X) :-
    in_poset(X),
    my_forall(in_poset(Y), le(X, Y)).

%-----------------
% Zadanie 5.

poset :-
    forall(in_poset(X),le(X, X)),
    forall(
        (in_poset(X), in_poset(Y), le(X, Y), le(Y, X)),
        X = Y
    ),
    forall(
        (in_poset(X), in_poset(Y), in_poset(Z), 
            le(X, Y), le(Y, Z)
        ),
        le(X, Z)
    ).