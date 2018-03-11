max_sum([H|T], X) :-
    max_sum(T, H, H, X).

max_sum([], _, Max, Max).
max_sum([H|T], MaxHere, Max, X) :-
    NewMaxHere is max(H, MaxHere + H),
    NewMax is max(Max, NewMaxHere),
    max_sum(T, NewMaxHere, NewMax, X).