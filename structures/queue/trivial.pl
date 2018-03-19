% Trivial queue
% queue(S1, S2).

dequeue(queue([H|T], L), H, queue(T, L)).
dequeue(queue([], L), H, Rem) :-
    reverse(Reverse, L),
    dequeue(queue(Reverse, []), H, Rem).

enqueue(queue(H, L), X, queue(H, [X|L])).