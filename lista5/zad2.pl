hetmany(N, P) :-
    numlist(1, N, L),
    permutation(L, P),
    dobra(P).

dobra(P) :-
    \+ zla(P).

zla(P) :-
    append(_, [Wi | L1], P),
    append(L2, [Wj | _], L1),
    length(L2, K),
    abs(Wi - Wj) =:= K + 1.

board(N) :-
    hetmany(N, Board),
    starting_color(N, Color),
    print_board(N, N, Board, Color).

starting_color(N, C) :- 0 is N mod 2 
    ->  (C = white);
        (C = black).

alter_color(white, black).
alter_color(black, white).

print_board(N, 0, _, _) :-
    horizontal_frame(N), !.

print_board(N, K, Queens, Color) :-
    horizontal_frame(N), nl,
    print_row(K, Queens, Color),
    print_row(K, Queens, Color),
    alter_color(Color, NextColor),
    K1 is K - 1,
    print_board(N, K1, Queens, NextColor).

horizontal_frame(0) :-
    write('+'), !.
horizontal_frame(N) :-
    write('+-----'),
    N1 is N - 1,
    horizontal_frame(N1).

print_row(_, [], _) :-
    write('|'), nl, !.
print_row(K, [Q|T], Color) :-
    write('|'),
    content(K, Q, Color, X),
    write(X),
    alter_color(Color, NextColor),
    print_row(K, T, NextColor).

content(N, N, Color, X) :-
    queen(Color, X), !.
content(_, _, Color, X) :-
    field(Color, X).
    
field(black, ':::::').
field(white, '     ').
queen(black, ':###:').
queen(white, ' ### ').