my_sum_list(List, Sum, Len) :-
    my_sum_list(List, 0, 0, Sum, Len).

% my_sum_list(List, AccSum, AccLen, Sum, Len).
% Get sum of all elements and length of array
my_sum_list([], AccSum, AccLen, AccSum, AccLen).
my_sum_list([H|T], AccSum, AccLen, Sum, Len) :-
    AS1 is H + AccSum,
    AL1 is AccLen + 1,
    my_sum_list(T, AS1, AL1, Sum, Len).

my_avg(List, Avg) :-
    my_sum_list(List, Sum, Len),
    Avg is Sum/Len.

% Get list of squares of difference to average
prep_varlist([], [], _).
prep_varlist([H|TH], [V|TV], Avg) :-
    V0 is H - Avg,
    V is V0 * V0,
    prep_varlist(TH, TV, Avg).

variance(List, D) :-
    my_avg(List, Avg),
    prep_varlist(List, VarList, Avg),
    my_avg(VarList, D).