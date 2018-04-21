wsT --> ` `.
wsT --> `\n`.
wsT --> `\t`.

ws --> [].
ws --> wsT, ws.


program([]) --> [].
program([I|IS]) --> 
    instrukcja(I),
    ws, 
    program(IS).


instrukcja([id(Id), sep(Sep)| Exp]) -->
    { identyfikator(Id) },
    `:=`.

identyfikator([X]) :- !, char_type(X, upper).
identyfikator([X|XS]) :- 
    char_type(X, upper),
    identyfikator(XS).