% 1. Find last element of list
my_last(X, [Y]) :- X = Y, !.
my_last(X, [_|T]) :- my_last(X, T).

% 2. Find but last element of list
my_but_last(X, [_, Y, _]) :- X = Y, !.
my_but_last(X, [_|T]) :- my_but_last(X, T).

% 3. Find k-th element of list (I assumed zero indexed)
elem_at(X, [H|_], 0) :- X = H, !.
elem_at(X, [_|T], Y) :- 
    Z is Y - 1,
    elem_at(X, T, Z).

% 4. Find length of array
my_len(0, []) :- true.
my_len(X, [_|T]) :- 
    my_len(Z, T), X is Z + 1. 

% 5. Reverse list
my_rev(X, Y) :- my_rev_tc(X, Y, []).
my_rev_tc(X, [], Acc) :- X = Acc.
my_rev_tc(X, [H2|T2], Acc) :- 
    my_rev_tc(X, T2, [H2|Acc]).

% 6. Check if palindrome
is_palindrome(X) :- my_rev(X, X), !.

% 7. Flatten
my_flatten([], []) :- true, !.
my_flatten([H|T], X) :-
    is_list(H),
    my_flatten(H, Y),
    my_flatten(T, Z),
    append(Y, Z, X).
my_flatten([H|T], X) :-
    \+ is_list(H),
    my_flatten(T, Z),
    X = [H|Z].

% 8. Eliminate
compress([H|T], Y) :- elim_rec(H, T, Y), !.

elim_rec(H, [], Y) :- Y = [H].
elim_rec(H, [H1|T], Y) :-
    H = H1, !, elim_rec(H, T, Y).
elim_rec(H, [H1|T1], [H2|T2]) :-
    H \= H1, H = H2, elim_rec(H1, T1, T2).

% 9. Pack
pack(List, X) :- pack_rec(List, [], X).

pack_rec([], [], []).
pack_rec([], Acc, X) :- X = [Acc], !.
pack_rec([H|T], [], X) :- pack_rec(T, [H], X).
pack_rec([H|T], Acc, X) :- Acc = [A| _], H = A, 
    pack_rec(T, [A|Acc], X).
pack_rec([H|T], Acc , X) :- Acc = [A| _], H \= A,
    X = [HX| TX], HX = Acc, pack_rec(T, [H], TX).

% 10. RLE
% TODO: