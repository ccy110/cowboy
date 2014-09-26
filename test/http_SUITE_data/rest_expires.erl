-module(rest_expires).

-export([init/2]).
-export([content_types_provided/2]).
-export([get_text_plain/2]).
-export([expires/2]).
-export([last_modified/2]).

init(Req, Opts) ->
	{rest, Req, Opts}.

content_types_provided(Req, State) ->
	{[{{<<"text">>, <<"plain">>, []}, get_text_plain}], Req, State}.

get_text_plain(Req, State) ->
	{<<"This is REST!">>, Req, State}.

expires(Req, State) ->
	{{{2012, 9, 21}, {22, 36, 14}}, Req, State}.

last_modified(Req, State) ->
	{{{2012, 9, 21}, {22, 36, 14}}, Req, State}.
