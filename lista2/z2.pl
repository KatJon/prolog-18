jednokrotnie(X, [X|T]) :-
    \+ member(X, T).

jednokrotnie(X, [H|T]) :-
    X \= H,
    jednokrotnie(X, T).

dwukrotnie(X, [X|T]) :-
    jednokrotnie(X, T).

dwukrotnie(X, [H|T]) :-
    X \= H,
    dwukrotnie(X, T).