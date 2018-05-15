:- module(merge_sort, [
    merge/3,
    split/3,
    merge_sort/2
]).

merge(L1, L2, Out) :- 
    freeze(L1, freeze(L2, (
        merge_actual(L1, L2, Out)
    ))).
merge_actual([H1|T1], [H2|T2], [H1|Os]) :-
    freeze(H1, freeze(H2, (
        H1 < H2, !, merge(T1, [H2|T2], Os)
    ))).
merge_actual([H1|T1], [H2|T2], [H2|Os]) :-
    freeze(H1, freeze(H2, (
        H1 >= H2, !, merge([H1|T1], T2, Os)
    ))).
merge_actual([], L, L).
merge_actual(L, [], L).

split(In, O1, O2) :- split(In, O1, O2, left).
split(In, O1, O2, Bucket) :- freeze(In, run_split(In, O1, O2, Bucket)).
run_split([X|Xs], [X|T1], O2, left) :- !, split(Xs, T1, O2, right).
run_split([X|Xs], O1, [X|T2], right) :- !, split(Xs, O1, T2, left).
run_split([], [], [], _).

merge_sort(X, Y) :-
    split(X, L, R), !,
    rec_sort(L, L1),
    rec_sort(R, R1), !,
    merge(L1, R1, Y).

rec_sort([], []).
rec_sort([X], [X]).
rec_sort(L, L1) :- merge_sort(L, L1).