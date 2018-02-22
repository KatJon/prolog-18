left_of(pencil, hourglass).
left_of(hourglass, buterfly).
left_of(buterfly, fish).

left_rec(X, Y) :- left_of(X, Y).
left_rec(X, Y) :- 
    left_of(X, Z), 
    left_rec(Z, Y).

above(bicycle, pencil).
above(camera, buterfly).

above_rec(X, Y) :- above(X, Y).
above_rec(X, Y) :- 
    above(X, Z), 
    above_rec(Z, Y).

right_of(X, Y) :- left_of(Y, X).
right_rec(X, Y) :- left_rec(Y, X).

below(X, Y) :- above(Y, X).
below_rec(X, Y) :- above_rec(Y, X).

% TODO: add other branches
higher(X, Y) :-
    above_rec(X, Z),
    (left_rec(Z, Y); right_rec(Z, Y)).

