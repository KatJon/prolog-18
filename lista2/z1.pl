middle(L, X) :-
    append(T1, [X|T2], L),
    same_length(T1, T2), !.