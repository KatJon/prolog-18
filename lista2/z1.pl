middle([X], X).

middle(L, X) :-
    append(T1,[H|T2], L),
    my_same_length(T1, T2),
    H = X.
    
% same_length/2 from stdlib
my_same_length([],[]).
my_same_length([_|T1], [_|T2]) :- 
    my_same_length(T1, T2).
