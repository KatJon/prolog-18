arc(a, b).
arc(b, a).
arc(b, c).
arc(c, d).

% istnieje droga z X do Y
osiagalny(X, Y) :- droga(X, Y, [X]).

droga(X, Y, _) :- arc(X, Y).

droga(X, Y, Visited) :-
    arc(X, Z),
    \+ member(Z, Visited),
    droga(Z, Y, [Z|Visited]).
    
    
    
    