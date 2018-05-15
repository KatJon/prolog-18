:- module(filozofowie, [
    filozofowie/0
]).

filozofowie :-
    run(_).
    
run([A,B,C,D,E]) :-
    thread_create(philosopher(p1), A),
    thread_create(philosopher(p2), B),
    thread_create(philosopher(p3), C),
    thread_create(philosopher(p4), D),
    thread_create(philosopher(p5), E).

philosopher(X) :-
    write(X),
    philosopher(X).