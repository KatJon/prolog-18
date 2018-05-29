:- module(run_queens, [
    run/0    
]).

:- use_module(library(pwp)).

run :- pwp_files('zad2/queens_in.html', 'zad2/queens.html').