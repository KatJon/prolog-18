p1 --> [].
p1 -->
    `a`,
    p1,
    `b`.

show_p1 :-
    length(X, _),
    phrase(p1, X), 
    format('~s',[X]).

nat(z).
nat(s(X)) :- nat(X).

p2 --> {nat(X)}, p2(X, X).

p2(z, X) --> p2b(X).
p2(s(X), Y) --> 
    `a`,
    p2(X, Y),
    `c`.

p2b(z) --> [].
p2b(s(X)) --> `b`, p2b(X).

show_p2 :- 
    phrase(p2, X),
    format('~s',[X]).