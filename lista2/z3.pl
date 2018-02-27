arc(a, b).
arc(b, a).
arc(b, c).
arc(c, d).

% istnieje droga z X do Y
osiagalny(X, Y) :- arc(X, Y).

osiagalny(X, Y) :- 
    arc(Z, Y),
    osiagalny(X, Z).