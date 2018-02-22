prime(Lo, Hi, X) :-
    between(Lo, Hi, X),
    check_prime(X).

check_prime(X) :- 
    SqrtX is floor(sqrt(X)),
    check_prime(X, SqrtX, 2).

check_prime(X, Z, Y) :-
    Y =< Z,
    Rem is X mod Y, \+ Rem = 0,
    check_prime(X, Z, Y+1).
check_prime(_, Z, Y) :- Y > Z.