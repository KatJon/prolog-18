% expression(List, Value, Expr).
expression([H|T], Value, Expr) :-
    make_expression(T, H, Expr),
    Value is Expr.

operation(E1, E2, E1 + E2).
operation(E1, E2, E1 - E2).
operation(E1, E2, E1 * E2).
operation(E1, E2, E1 / E2) :- E2 =\= 0.

make_expression([], Expr, Expr).
make_expression([H|T], Curr, Expr) :-
    operation(Curr, H, NewCurr),
    make_expression(T, NewCurr, Expr).
make_expression([H1, H2|T], Curr, Expr) :-
    operation(H1, H2, Partial),
    make_expression([Partial| T], Curr, Expr).