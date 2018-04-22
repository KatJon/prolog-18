base_matches(List) :- numlist(1, 24, List).

select_k(0, L, L).
select_k(K, L, Res) :-
    select(_, L, X),
    K1 is K - 1,
    select_k(K1, X, Res).
    

zapalki(K, (duze(D), srednie(S), male(M))) :-
    base_matches(Base),

    select_k(K, Base, L),

    write(a),
    take_bigs(D, Bigs),
    take_mids(S, Mids),
    take_smalls(M, Smalls),

    intersection(Bigs, L, Bigs),
    intersection(Mids, L, Mids),
    intersection(Smalls, L, Smalls),
    write_matches(L).

take_bigs(D, Res) :-
    big_squares(List),
    subseq(Bigs, List),
    length(Bigs, D),
    flat_union(Bigs, Res).

take_mids(S, Res) :-
    mid_squares(List),
    subseq(Mids, List),
    length(Mids, S),
    flat_union(Mids, Res).

take_smalls(M, Res) :-
    small_squares(List),
    subseq(Smalls, List),
    length(Smalls, M),
    flat_union(Smalls, Res).

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