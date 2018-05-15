:- module(parser, [
    parse/2,
    program/3
]).

parse(Tokens, AST) :- program(AST, Tokens, []).

program([]) --> [].
program([I|Is]) -->
    instruction(I),
    [sep(';')],
    program(Is).

instruction(assign(Id, Expr)) --> 
    [id(Id)],
    [sep(':=')],
    expression(Expr).

instruction(read(Id)) -->
    [key(read)],
    [id(Id)].

instruction(write(E)) -->
    [key(write)],
    expression(E).

instruction(if(Cond, Then)) -->
    [key(if)],
    condition(Cond),
    [key(then)],
    program(Then),
    [key(fi)].

instruction(if(Cond, Then, Else)) -->
    [key(if)],
    condition(Cond),
    [key(then)],
    program(Then),
    [key(else)],
    program(Else),
    [key(fi)].

instruction(while(Cond, Do)) -->
    [key(while)],
    condition(Cond),
    [key(do)],
    program(Do),
    [key(od)].

expression(L + R) -->
    summand(L),
    [sep('+')],
    expression(R).
expression(L - R) -->
    summand(L),
    [sep('-')],
    expression(R).

expression(E) -->
    summand(E).

summand(L * R) -->
    factor(L),
    [sep('*')],
    summand(R).

summand(L / R) -->
    factor(L),
    [sep('/')],
    summand(R).

summand(L mod R) -->
    factor(L),
    [key('mod')],
    summand(R).

summand(E) --> factor(E).

factor(id(Id)) --> [id(Id)].

factor(int(Int)) --> [int(Int)].

factor(E) -->
    [sep('(')], 
    expression(E),
    [sep(')')].

condition((L;R)) -->
    conjunction(L),
    [key('or')],
    condition(R).

condition(L) -->
    conjunction(L).

conjunction((L,R)) -->
    base_cond(L),
    [key('and')],
    conjunction(R).

conjunction(L) -->
    base_cond(L).

base_cond(L =:= R) -->
    expression(L),
    [sep('=')],
    expression(R).

base_cond(L =\= R) -->
    expression(L),
    [sep('/=')],
    expression(R).

base_cond(L < R) -->
    expression(L),
    [sep('<')],
    expression(R).

base_cond(L > R) -->
    expression(L),
    [sep('>')],
    expression(R).

base_cond(L =< R) -->
    expression(L),
    [sep('=<')],
    expression(R).

base_cond(L >= R) -->
    expression(L),
    [sep('>=')],
    expression(R).

base_cond(Cond) -->
    [sep('(')],
    condition(Cond),
    [sep(')')].