base_matches(List) :- numlist(1, 24, List).

remove_k(0, X, X).
remove_k(K, [_|L1], L2) :-
    K > 0,
    K1 is K - 1,
    remove_k(K1, L1, L2).
remove_k(K, [X|L1], [X|L2]) :-
    K > 0,
    remove_k(K, L1, L2).

subseq([], _).
subseq([H|Xs], [H|Ys]) :-
    subseq(Xs, Ys).
subseq(X, [_|Ys]) :-
    subseq(X, Ys).

flat_union(X, Res) :-
    flat_union(X, Flat, []),
    sort(Flat, Res).

flat_union([], Res, Res).
flat_union([H|T], Res, Bag) :-
    union(H, Bag, X),
    flat_union(T, Res, X).

zapalki(K, D, S, M) :-
    base_matches(Base),
    remove_k(K, Base, L),

    big_squares(BS),
    mid_squares(MS),
    small_squares(SS),

    has_squares(D, BS, L),
    has_squares(S, MS, L),
    has_squares(M, SS, L),

    write_matches(L).

has_squares(0, [], _).
has_squares(0, Squares, List) :-
    member(S, Squares),
    \+ intersection(S, List, S).
    
has_squares(K, Squares, List) :-
    K > 0,
    select(S, Squares, NextSq),
    intersection(S, List, S),
    K1 is K - 1,
    has_squares(K1, NextSq, List).

big_squares(Bigs) :-
    Bigs = [
        [1,2,3,4,7,11,14,18,21,22,23,24]
    ].

mid_squares(Mids) :-
    Mids = [
        [1, 2, 4, 6, 11, 13, 15, 16],
        [2, 3, 5, 7, 12, 14, 16, 17],
        [8, 9, 11, 13, 18, 20, 22, 23],
        [9, 10, 12, 14, 19, 21, 23, 24]
    ].

small_squares(Smalls) :-
    Smalls = [
        [1,4,5,8],
        [2,5,6,9],
        [3,6,7,10],
        [8,11,12,15],
        [9,12,13,16],
        [10,13,14,17],
        [15,18,19,22], 
        [16,19,20,23],
        [17,20,21,24]
    ].

write_matches(Matches) :-
    checkH([1,2,3], Matches),
    checkV([4,5,6,7], Matches),
    checkH([8,9,10], Matches),
    checkV([11,12,13,14], Matches),
    checkH([15,16,17], Matches),
    checkV([18,19,20,21], Matches),
    checkH([22,23,24], Matches).

checkH([], _) :- write('+'), nl.
checkH([N|T], Matches) :-
    (member(N, Matches) 
        -> write('+---')
        ; write('+   ')),
    checkH(T, Matches).

checkV([], _) :- nl.
checkV([N|T], Matches) :-
    (member(N, Matches)
        -> write('|   ')
        ; write('    ')),
    checkV(T, Matches).