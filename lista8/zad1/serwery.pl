:- module(serwery, [
    serwery/2  
]).

:- use_module(library(xpath)).
:- use_module(library(url)).
:- use_module(library(sgml)).

serwery(File, ServerList) :-
    load_html(File, Html, []),
    setof(Server, find_server(Html, Server), ServerList).

find_server(Html, Server) :-
    xpath(Html, //a(@href), Link0),
    global_url(Link0, 'localhost', Link),
    parse_url(Link, Parse),
    get_host(Parse, Server).

get_host([host(Host)|_], Host) :- !.
get_host([_|Xs], Host) :- get_host(Xs, Host).
