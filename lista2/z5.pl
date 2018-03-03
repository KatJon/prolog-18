% imported from z2
jednokrotnie(X, [X|T]) :-
        \+ member(X, T).
    
jednokrotnie(X, [H|T]) :-
    X \= H,
    jednokrotnie(X, T).

dwukrotnie(X, [X|T]) :-
    jednokrotnie(X, T).
    
dwukrotnie(X, [H|T]) :-
    X \= H,
    dwukrotnie(X, T).

% end import from z2

lista(N, List) :-
    good_length(N, List),
    good_elements(N, List),
    good_sublist(N, List).

good_length(N, List) :-
    length(List, Y),
    Y =:= 2 * N.

good_elements(N, List) :- 
    forall(
        between(1, N, V), 
        dwukrotnie(V, List)
    ).
    
good_sublist(N, List) :- 
    forall(
        between(1, N, V),
        (
            get_sublist(V, List, Sublist),
            length(Sublist, Len),
            Len mod 2 =:= 0
        )    
    ).

get_sublist(X, List, Sublist) :-
    append(_, [X|Sublist], SubWithPrefix),
    append(SubWithPrefix, [X|_], List).
    

% get_sublist(X, [X|T], Sublist) :- 
%     finish_sublist(X, T, Sublist, []).

% get_sublist(X, [H|T], Sublist) :-
%     H \= X,
%     get_sublist(X, T, Sublist).

% finish_sublist(X, [X|_], Sublist, Acc) :-
%     reverse(Sublist, Acc).

% finish_sublist(X, [H|T], Sublist, Acc) :-
%     H \= X,
%     finish_sublist(X, T, Sublist, [H|Acc]).
