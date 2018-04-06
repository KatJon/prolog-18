init_matches(X) :-
    X = [
        row(t,t,t),
        col(t,t,t,t),
        row(t,t,t),
        col(t,t,t,t),
        row(t,t,t),
        col(t,t,t,t),
        row(t,t,t)
    ].

hmatch(t) :- write("---").
hmatch(f) :- write("   ").

vmatch(t) :- write("|").
vmatch(f) :- write(" ").

print_row(M1, M2, M3) :-
    write("+"), hmatch(M1),
    write("+"), hmatch(M2),
    write("+"), hmatch(M3),
    write("+"), nl.

print_col(M1, M2, M3, M4) :-
    vmatch(M1), write("   "),
    vmatch(M2), write("   "),
    vmatch(M3), write("   "),
    vmatch(M4), nl.

print_matches([]).
print_matches([row(A,B,C)|T]) :-
    print_row(A, B, C),
    print_matches(T).
print_matches([col(A,B,C,D)|T]) :-
        print_col(A, B, C, D),
        print_matches(T).

big_square(X) :-
    X = [
        row(t,t,t),
        col(t,_,_,t),
        _,
        col(t,_,_,t),
        _,
        col(t,_,_,t),
        row(t,t,t)
    ].

medium_square(X) :-
    X = [
        row(t,t,_),
        col(t,_,t,_),
        _,
        col(t,_,t,_),
        row(t,t,_)
        | _
    ].

medium_square(X) :-
    X = [
        row(_,t,t),
        col(_,t,_,t),
        _,
        col(_,t,_,t),
        row(_,t,t)
        | _
    ].

medium_square([_,_|Xs]) :-
    medium_square(Xs).

small_square(X) :-
    X = [
        row(t,_,_),
        col(t,t,_,_)
        | _
    ].