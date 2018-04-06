bfck(P) --> program(P).

program([E]) --> expr(E).
program([E|Es]) -->
    expr(E),
    program(Es).

expr(plus) --> "+".
expr(minus) --> "-".
expr(left) --> "<".
expr(right) --> ">".
expr(out) --> ".".
expr(in) --> ",".
expr(loop(L)) --> loop_term(L).

loop_term(L) --> 
    "[",
    program(L),
    "]".
