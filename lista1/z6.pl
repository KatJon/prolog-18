prime(Lo, Hi, X) :-
    between(Lo, Hi, X),
    check_prime(X).

check_prime(X) :- 
    SqrtX is floor(sqrt(X)),
    Rem is X mod 2, 
    \+ (Rem = 0, X \= 2),
    check_prime(X, SqrtX, 3).

check_prime(X, Z, Y) :-
    Y =< Z,
    Rem is X mod Y, \+ Rem = 0,
    Y1 is Y +2,
    check_prime(X, Z, Y1).
check_prime(_, Z, Y) :- Y > Z.

% Presentation
use_module(library(statistics)).

prime_time(Lo, Hi, X) :-
    time(prime(Lo, Hi, X)).