jednokrotnie(X, L) :-
    select(X, L, TL),
    \+ member(X, TL).

dwukrotnie(X, L) :-
    select(X, L, TL),
    jednokrotnie(X, TL).