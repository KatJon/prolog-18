:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_client)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_files)).

:- use_module(form).
:- use_module(queens).

:- http_handler(root(queens), handler_queens, []).
:- http_handler(root(solution), handler_solution, []).
:- http_handler(root(.), http_reply_from_files('pic', []), [prefix]).

% server(+Port) uruchomienie serwera na danym porcie
%
server(Port) :-
	http_server(http_dispatch, [port(Port)]).

handler_queens(_Request) :-
	DOPISZ KOD OBSLUGUJACY USLUGE QUEENS.

handler_solution(Request) :-
	DOPISZ KOD OBSLUGUJACY USLUGE SOLUTION.

DOPISZ REGULY GRAMATYKI METAMORFICZNEJ DO WYGENEROWANIA HTML.

