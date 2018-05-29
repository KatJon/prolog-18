:- module(generator, [run/2]).

:- use_module(library(pwp)).

run(In, Out) :- pwp_files(In, Out).
