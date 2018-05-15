:- use_module(lexer).
:- use_module(parser).
:- use_module(imperator).

wykonaj(FileName) :-
    open(FileName, read, Str),
    scanner(Str, Tokens),
    !, close(Str),
    program(AST, Tokens, []),
    interpreter(AST).