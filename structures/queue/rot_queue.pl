% Data Structure: 
% rotqueue(L, R, A)

empty_queue(rotqueue([], [], [])).

% rotate(L, R, A, Q)
rotate([], [H|_], A, [H|A]).
rotate([HL|TL], [HR|TR], A, [HL|TQ]) :-
    rotate(TL, TR, [HR|A], TQ).

% makeq(L, R, A, Q)
makeq(L, R, [], Queue) :-
    rotate(L, R, [], X),
    Queue = rotqueue(X,[],X).

makeq(L, R, [_|T], Queue) :-
    Queue = rotqueue(L, R, T).

% enqueue(E, Q, Q1)
enqueue(E, rotqueue(L, R, A), Queue) :-
    makeq(L, [E|R], A, Queue).

% dequeue(Q, E, Rem)
dequeue(rotqueue(L, R, A), E, Queue) :-
    L = [E| TL],
    makeq(TL, R, A, Queue).

new_queue(List, Queue) :-
    empty_queue(X),
    add_all(List, X, Queue).

add_all([], Queue, Queue).
add_all([H|T], Q, Queue) :-
    enqueue(H, Q, Q1),
    add_all(T, Q1, Queue).
