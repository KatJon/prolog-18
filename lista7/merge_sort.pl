:- module(merge_sort, [
    merge/3,
    split/3,
    merge_sort/2
]).

merge(L1, L2, Out) :- freeze(L1, freeze(L2, 
    (   L1 = [H1|T1]
    ->  (   L2 = [H2|T2]
        ->  (   H1 @< H2
            ->  (Out = [H1|OutL], merge(T1, L2, OutL))  
            ;   (Out = [H2|OutR], merge(L1, T2, OutR))
            )
        ;   Out = L1
        )
    ;   Out = L2
    ))).

split(In, Left, Right) :- freeze(In, 
    (   In = [H1|In1]
    ->  (Left = [H1|Left1], freeze(In1, 
            (   In1 = [H2|In2]
            ->  (   Right = [H2|Right1]
                ,   split(In2, Left1, Right1)
                )
            ;   (Left1 = [], Right = [])
            )
        ))
    ;   (Left = [], Right = [])
    )).

merge_sort(X, Y) :- freeze(X, 
    (   X = [_|X1]
    ->  freeze(X1, 
            (   X1 = [_|_]
            ->  (   split(X, L, R)
                ,   merge_sort(L, L1)
                ,   merge_sort(R, R1)
                ,   merge(L1, R1, Y)
                )
            ;   Y = X
            )
        )
    ;   Y = X
    )).