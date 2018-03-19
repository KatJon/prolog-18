even_perm(List, Perm) :-
    permutation(List, Perm),
    count_inversions(List, Perm, N),
    N mod 2 =:= 0.

odd_perm(List, Perm) :-
    permutation(List, Perm),
    count_inversions(List, Perm, N),
    N mod 2 =:= 1.

count_inversions([], [], 0).
count_inversions([X], [X], 0).
count_inversions(List, Perm, N) :-
    count_inversions(List, List, Perm, 0, N).

count_inversions([], _, _, Acc, Acc).
count_inversions([H|T], List, Perm, Acc, N) :-
    count_by_E1(List, Perm, H, Acc1),
    NextAcc is Acc + Acc1,
    count_inversions(T, List, Perm, NextAcc, N).

count_by_E1(List, Perm, E1, Acc) :-
    count_by_E2(List, List, Perm, E1, 0, Acc).

count_by_E2([], _, _, _, Acc, Acc).
count_by_E2([H|T], List, Perm, E1, Acc, N) :-
    (is_before(E1, H, List), is_before(H, E1, Perm)
        -> NextAcc is Acc + 1; NextAcc is Acc),
    count_by_E2(T, List, Perm, E1, NextAcc, N).

is_before(_, E2, [E2| _]) :- !, fail.
is_before(E1, _, [E1| _]) :- !.
is_before(E1, E2, [_|T]) :-
    is_before(E1, E2, T).