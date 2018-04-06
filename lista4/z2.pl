nr(1).
nr(2).
nr(3).
nr(4).
nr(5).

pairwise_diff(A, B, C, D, E) :-
    nr(A), nr(B), nr(C), nr(D), nr(E),
    A \= B, A \= C, A \= D, A \= E,
    B \= C, B \= D, B \= E,
    C \= D, C \= E,
    D \= E.

person(A, B, C, D, E) :- pairwise_diff(A, B, C, D, E).
color(A, B, C, D, E) :- pairwise_diff(A, B, C, D, E).
tobacco(A, B, C, D, E) :- pairwise_diff(A, B, C, D, E).
pet(A, B, C, D, E) :- pairwise_diff(A, B, C, D, E).
drink(A, B, C, D, E) :- pairwise_diff(A, B, C, D, E).

na_lewo(X, Y) :- X =:= Y - 1.
na_prawo(X, Y) :- X =:= Y + 1.

sasiad(A, B) :- na_prawo(A, B).
sasiad(A, B) :- na_lewo(A, B).

einstein(Kto) :-
    Norweg = 1, % R1
    Mleko = 3, % R8
    Niebieski = 2, % sasiad(Norweg, Niebieski), % R12
    Anglik = Czerwony, % R2
    Dunczyk = Herbata, % R4
    Zolty = Cygaro, % R6
    Niemiec = Fajka, % R7
    BezFiltra = Ptaki, % R10
    Szwed = Pies, % R11
    Mentolowe = Piwo, % R14
    Zielony = Kawa, % R15.
    person(Norweg, Anglik, Dunczyk, Niemiec, Szwed),
    color(Czerwony, Zielony, Zolty, Niebieski, Bialy),
    tobacco(Light, Cygaro, Fajka, BezFiltra, Mentolowe),
    drink(Herbata, Mleko, Piwo, Woda, Kawa),
    pet(Kot, Pies, Kon, Rybki, Ptaki),
    na_lewo(Zielony, Bialy), % R3
    sasiad(Light, Woda), % R9
    sasiad(Light, Kot), % R5
    sasiad(Kon, Zolty), % R13
    write_solution(Norweg, Anglik, Dunczyk, Niemiec, Szwed, Rybki, Kto).

write_solution(Rybki, _, _, _, _, Rybki, norweg).
write_solution(_, Rybki, _, _, _, Rybki, anglik).
write_solution(_, _, Rybki, _, _, Rybki, dunczyk).
write_solution(_, _, _, Rybki, _, Rybki, niemiec).
write_solution(_, _, _, _, Rybki, Rybki, szwed).
