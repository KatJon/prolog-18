separator(';').
separator('+').
separator('-').
separator('*').
separator('/').
separator('(').
separator(')').
separator('<').
separator('>').
separator('=<').
separator('>=').
separator(':=').
separator('=').
separator('/=').

keyword('read').
keyword('write').
keyword('if').
keyword('then').
keyword('else').
keyword('fi').
keyword('while').
keyword('do').
keyword('od').
keyword('and').
keyword('or').
keyword('mod').

main :-
    open('ex1.prog', read, Str),
    scanner(Str, Tokens),
    writeq(Tokens),
    !, close(Str).

scanner(Str, Tokens) :-
    scan(Str, [], Input),
    tokenize(Input, Tokens).

tokenize([], []).
tokenize(In, [sep(Sep)|Tokens]) :-
    separator(Sep),
    atom_chars(Sep, SepChr),
    append(SepChr, In1, In),
    tokenize(In1, Tokens).
tokenize(In, [key(Key)|Tokens]) :-
    keyword(Key),
    atom_chars(Key, KeyChr),
    append(KeyChr, In1, In),
    tokenize(In1, Tokens).
tokenize(In, [id(Id)|Tokens]) :-
    get_identifier(In, Id, Rem),
    tokenize(Rem, Tokens).
tokenize(In, [int(Int)|Tokens]) :-
    get_integer(In, Int, Rem),
    tokenize(Rem, Tokens).
tokenize([_|Xs], Tokens) :-
    tokenize(Xs, Tokens).

get_identifier(In, Ret, Rem) :-
    get_identifier(In, [], Ret, Rem).
get_identifier([], Acc, Ret, []) :-
    reverse(Acc, ChList),
    atom_chars(Ret, ChList).
get_identifier([H|T], Acc, Ret, Rem) :-
    char_type(H, upper),
    get_identifier(T, [H|Acc], Ret, Rem).
get_identifier(In, Acc, Ret, In) :-
    In = [H|_],
    \+ char_type(H, upper), 
    Acc \= [],
    reverse(Acc, ChList),
    atom_chars(Ret, ChList).
    
get_integer(In, Ret, Rem) :-
    get_integer(In, [], Ret, Rem).
get_integer([], Acc, Ret, []) :-
    reverse(Acc, ChList),
    atom_chars(AtomNum, ChList),
    atom_number(AtomNum, Ret).
get_integer([H|T], Acc, Ret, Rem) :-
    char_type(H, digit),
    get_integer(T, [H|Acc], Ret, Rem).
get_integer(In, Acc, Ret, In) :-
    In = [H|_],
    \+ char_type(H, upper), 
    Acc \= [],
    reverse(Acc, ChList),
    atom_chars(AtomNum, ChList),
    atom_number(AtomNum, Ret).

scan(Str, Acc, Input) :- 
    get_char(Str, Char),
    next_char(Str, Acc, Char, Input).

next_char(_, Acc, end_of_file, Input) :- !, reverse(Acc, Input).
next_char(Str, Acc, '\n' , Input) :- !, scan(Str, Acc, Input).
next_char(Str, Acc, '\t' , Input) :- !, scan(Str, Acc, Input).
next_char(Str, Acc, ' ' , Input) :- !, scan(Str, Acc, Input).
next_char(Str, Acc, C, Input) :- scan(Str, [C|Acc], Input).
