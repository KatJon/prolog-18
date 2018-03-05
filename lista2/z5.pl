use_module(library(apply)).

% get valid sublist
get_sublist(X, [X|T], Sublist) :- 
    finish_sublist(X, T, Sublist, []), !.

get_sublist(X, [H|T], Sublist) :-
    H \= X,
    get_sublist(X, T, Sublist).

finish_sublist(X, [X|_], Sublist, Acc) :-
    reverse(Sublist, Acc), !.

finish_sublist(X, [H|T], Sublist, Acc) :-
    H \= X,
    finish_sublist(X, T, Sublist, [H|Acc]).

valid_sublist(List, V) :-
        get_sublist(V, List, Sublist),
        length(Sublist, Len),
        Len mod 2 =:= 0.

% We know, that it has length 2*N, and every elem 1..N is in list twice
gen_list(N, GenList) :-
    numlist(1, N, HalfList),
    append(HalfList, HalfList, AppList),
    permutation(AppList, GenList).
    
good_sublists(N, List) :-
    numlist(1, N, Vs),
    maplist(valid_sublist(List), Vs).

strict_prefix(List, V, Pref) :-
    strict_prefix(List, V, [], Pref), !.
strict_prefix([V|_], V, Acc, Pref) :-
    reverse(Acc, Pref).
strict_prefix([H|T], V, Acc, Pref) :-
    H \= V,
    strict_prefix(T, V, [H|Acc], Pref).

occured(Prefix, K) :-
    member(K, Prefix), !.
    
valid_earlier(_, 1).
valid_earlier(List, V) :-
    Max is V - 1,
    numlist(1, Max, K),
    strict_prefix(List, V, Prefix),
    maplist(occured(Prefix), K).

valid_numeration(N, List) :-
    numlist(1, N, Vs),
    maplist(valid_earlier(List),Vs).

lista_base(N, List) :-
    gen_list(N, List),
    valid_numeration(N, List),
    good_sublists(N, List).

lista(N, List) :-
    distinct(List, lista_base(N, List)).