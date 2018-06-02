:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_client)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_files)).

:- use_module(queens).
:- use_module(form).

:- http_handler(root('.'), http_reply_from_files('pic', []), [prefix]).
server(Port) :-
	http_server(http_dispatch, [port(Port)]),
	format('Queens: http://localhost:~w/queens~n', [Port]).

start_html :-
	format('Content-type: text/html~n~n'),
	format('<!DOCTYPE html><html><head><title>Queens</title>~n'),
	format('<meta http-equiv="content-type" content="text/html; charset=UTF-8">~n'),
	format('</head><body>~n').

end_html :- 
	format('</body></html>').

:- http_handler(root(queens), handler_queens, []).
handler_queens(_) :- 
		start_html,
		format('<h1>Give problem size</h1>~n'),
		build_form([action('solution'), method('post')], [
			label(size, 'Size:'),
			input(text, size),
			input(submit, 'Submit')
		]),
		end_html.

:- http_handler(root(solution), handler_solution, []).
handler_solution(Request) :- 
	check_request(Request, N),
	queens(N, Solution),
	start_html,
	format('<h1>Solution for N = ~w</h1>', [N]),
	phrase(format_solution(N, Solution), TableBody),
	format('<table>~s</table>', [TableBody]),
	end_html.

check_request(Request, N) :-
	member(method(post), Request), !,
	http_read_data(Request, Data, []),
	member(size = Size, Data),
	atom_number(Size, N).

format_solution(_, []) --> [].
format_solution(N, [H|T]) -->
	`<tr>`, format_row(N, H, 1), `</tr>`,
	format_solution(N, T).

format_row(N, _, C) --> {C > N}, ``.
format_row(N, X, C) --> { X =:= C }, { C1 is C + 1 },
	`<td><img src="queen.png"/></td>`,
	format_row(N, X, C1). 

format_row(N, X, C) --> { X =\= C }, { C1 is C + 1 },
	`<td><img src="empty.png"/></td>`,
	format_row(N, X, C1). 