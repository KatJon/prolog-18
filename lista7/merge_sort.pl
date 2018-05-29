:- module(merge_sort, [
    my_merge/3,
    split/3,
    merge_sort/2
]).

my_merge(L1, L2, Out) :- freeze(L1, freeze(L2, 
    (   L1 = [H1|T1]
    ->  (   L2 = [H2|T2]
        ->  (   H1 @< H2
            ->  (Out = [H1|OutL], my_merge(T1, L2, OutL))  
            ;   (Out = [H2|OutR], my_merge(L1, T2, OutR))
            )
        ;   Out = L1
        )
    ;   Out = L2
    ))).

split(In, Left, Right) :- freeze(In, 
    (   In = [H1|In1]
    ->  (   Left = [H1|Left1]
        ,   split(In1, Right, Left1)
        )
    ;   (Left = [], Right = [])
    )).

merge_sort(X, Y) :- freeze(X, 
    (   X = [_|X1]
    ->  freeze(X1, 
            (   X1 = [_|_]
            ->  (   split(X, L, R)
                ,   merge_sort(L, L1)
                ,   merge_sort(R, R1)
                ,   my_merge(L1, R1, Y)
                )
            ;   Y = X
            )
        )
    ;   Y = X
    )).