% Test dictionary
mezczyzna(c).
mezczyzna(a).
mezczyzna(q).

kobieta(b).
kobieta(d).
kobieta(w).

matka(b, d).
matka(b, c).
matka(w, b).

ojciec(a, d).
ojciec(a, c).
ojciec(q, a).

rodzic(X, Y) :- matka(X, Y).
rodzic(X, Y) :- ojciec(X, Y).

% Rules
jest_matka(X) :- matka(X, _).

jest_ojcem(X) :- ojciec(X, _).

jest_synem(X) :- rodzic(_, X), mezczyzna(X).

siostra(X, Y) :- 
    kobieta(X),
    rodzic(Z, X), 
    rodzic(Z, Y),
    X \= Y.

dziadek(X, Y) :- 
    ojciec(X, Z), rodzic(Z, Y).

rodzenstwo(X, Y) :- 
    rodzic(Z, X), rodzic(Z, Y), X \= Y.