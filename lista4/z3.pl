base_matches(List) :- numlist(1, 24, List).

zapalki(K, (duze(D), srednie(S), male(M))) :-
% zapalki(K) :-
    base_matches(Base),
    subseq(L, Base),
    length(L, Len),
    Len is 24 - K,
    take_big(L, D),
    write_matches(L).
    

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

big_square(Matches) :-
    subset([1,2,3,4,7,11,14,18,21,22,23,24], Matches).

mid_square(Matches) :-
    subset([1,2,4,6,11,13,15,16], Matches).
mid_square(Matches) :-
    subset([2, 3, 5, 7, 12, 14, 16, 17], Matches).
mid_square(Matches) :-
    subset([8,9,11,13,18,20,22,23], Matches).
mid_square(Matches) :-
    subset([9, 10, 12, 14, 19, 21, 23, 24], Matches).

small_square(Matches) :-
    subset([1,4,5,8], Matches).
small_square(Matches) :-
    subset([2,5,6,9], Matches).
small_square(Matches) :-
    subset([3,6,7,10], Matches).
small_square(Matches) :-
    subset([8,11,12,15], Matches).
small_square(Matches) :-
    subset([9,12,13,16], Matches).
small_square(Matches) :-
    subset([10,13,14,17], Matches).
small_square(Matches) :-
    subset([15,18,19,22], Matches).
small_square(Matches) :-
    subset([16,19,20,23], Matches).
small_square(Matches) :-
    subset([17,20,21,24], Matches).

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
