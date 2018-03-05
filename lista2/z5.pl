merge_zip([], [], []).
merge_zip([H1|T1],[H2|T2], [H1,H2|Tail]) :-
    merge_zip(T1, T2, Tail).

lista(N, List) :-
    numlist(1, N, L1),
    permutation(L2, L1),
    merge_zip(L1, L2, List).