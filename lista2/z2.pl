once_in(X, [X|T]) :-
    \+ member(X, T).

once_in(X, [H|T]) :-
    X \= H,
    once_in(X, T).

twice_in(X, [X|T]) :-
    once_in(X, T).

twice_in(X, [H|T]) :-
    X \= H,
    twice_in(X, T).