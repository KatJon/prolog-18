browse(Term) :-
    browse(Term, []).

browse(Term, History) :-
    write(Term), nl, 
    write('command: '), flush, read(Cmd),
    exec_cmd(Cmd, Term, History).

exec_cmd(o, _, []).
exec_cmd(o, Term, History) :- 
    move_up(Term, History, NewTerm, NewHistory),
    browse(NewTerm, NewHistory).

exec_cmd(i, Term, History) :- 
    move_in(Term, History, NewTerm, NewHistory),
    browse(NewTerm, NewHistory).

exec_cmd(n, _, []).
exec_cmd(n, Term, History) :-
    move_next(Term, History, NewTerm, NewHistory),
    browse(NewTerm, NewHistory).

exec_cmd(p, _, []).
exec_cmd(p, Term, History) :-
    move_prev(Term, History, NewTerm, NewHistory),
    browse(NewTerm, NewHistory).

exec_cmd(_, _, _).

move_up(Term, [Parent|NewHistory], NewTerm, NewHistory) :-
    Parent = (V, Prev, Next),
    reverse(Prev, Prev1),
    append(Prev1, [Term|Next], Children),
    NewTerm =.. [V|Children].

move_in(Term, History, Term, History) :-
    Term =.. [V],  
    write('Cannot go into '), write(V), write('/0.'), nl.

move_in(Term, History, NewTerm, NewHistory) :-
    Term =.. [V, NewTerm|Next],
    P = (V, [], Next),
    NewHistory = [P|History].

move_next(Term, [P|History], NewTerm, NewHistory) :-
    P = (V, Prev, [NewTerm|Next]),
    Parent = (V, [Term|Prev], Next),
    NewHistory = [Parent|History].

move_next(Term, History, Term, History) :-
    History = [P|_],
    P = (_, _, []),
    write('There is no next brother.'), nl.

move_prev(Term, [P|History], NewTerm, NewHistory) :-
    P = (V, [NewTerm|Prev], Next),
    Parent = (V,Prev, [Term|Next]),
    NewHistory = [Parent|History].
    
move_prev(Term, History, Term, History) :-
    History = [P|_],
    P = (_, [], _),
    write('There is no previous brother.'), nl.
