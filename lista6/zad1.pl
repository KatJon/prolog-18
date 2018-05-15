:- use_module(lexer).
:- use_module(parser).

main :-
    open('ex/ex1.prog', read, Str),
    scanner(Str, Tokens),
    !, close(Str),
    program(AST, Tokens, []),
    write(AST).
