base_matches(List) :- numlist(1, 24, List).

big_square(Matches) :-
    subset([1,2,3,4,7,11,14,18,21,22,23,24], Matches).

zapalki(N, (duze(D), srednie(S), male(M))) :- 
    base_matches(Base),
    subset(List, Base),
    % length(List, Len),
    % Len is 24 - N,
    print_matches(List).

print_matches(List) :-
    write('Rozwiazanie:'), nl,
    printV(List, 1, 1).

printV(L, N, Start) :-
    member(N, L), !,
    write('+---'),
    nextV(L, N, Start).

printV(L, N, Start) :-
    write('+   '),
    nextV(L, N, Start).

nextV(_, 24, _) :- !, write('+').

nextV(L, N, Start) :-
    N1 is N + 1,
    N < Start + 2,
    printV(L, N1, Start).

nextV(L, N, Start) :-
    N1 is N + 1,
    N >= Start + 2,
    write('+'), nl,
    printH(L, N1, N1).

printH(L, N, Start) :-
    member(N, L), 
    write('|   '),
    nextH(L, N, Start).

printH(L, N, Start) :-
    write('    '),
    nextH(L, N, Start).

nextH(_, 24, _) :- !.

nextH(L, N, Start) :-
    N1 is N + 1,
    N < Start + 3,
    printH(L, N1, Start).

nextH(L, N, Start) :-
    N1 is N + 1, 
    N >= Start + 3,
    nl, 
    printV(L, N1, N1).
