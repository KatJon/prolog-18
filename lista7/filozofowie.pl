:- module(filozofowie, [
    filozofowie/0
]).

filozofowie :-
    mutex_create(F1),
    mutex_create(F2),
    mutex_create(F3),
    mutex_create(F4),
    mutex_create(F5),
    
    thread_create(philosopher(1, F1, F2), _),
    thread_create(philosopher(2, F2, F3), _),
    thread_create(philosopher(3, F3, F4), _),
    thread_create(philosopher(4, F4, F5), _),
    thread_create(philosopher(5, F5, F1), _).

philosopher(X, L, R) :-
    format('[~w] mysli~n', [X]),
    format('[~w] chce prawy widelec~n', [X]),
    mutex_lock(R),
    format('[~w] podniósł prawy widelec~n', [X]),
    format('[~w] chce lewy widelec~n', [X]),
    mutex_lock(L),
    format('[~w] podniósł lewy widelec~n', [X]),
    format('[~w] je~n', [X]),
    mutex_unlock(R),
    format('[~w] odłożył prawy widelec~n', [X]),
    mutex_unlock(L),
    format('[~w] odłożył lewy widelec~n', [X]),   
    philosopher(X, L, R).