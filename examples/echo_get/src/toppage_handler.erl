%% Feel free to use, reuse and abuse the code in this file.

%% @doc GET echo handler.
-module(toppage_handler).

-export([init/2]).
-export([handle/2]).

init(Req, Opts) ->
	{http, Req, Opts}.

handle(Req, State) ->
	Method = cowboy_req:method(Req),
	#{echo := Echo} = cowboy_req:match_qs(Req, [echo]),
	Req2 = echo(Method, Echo, Req),
	{ok, Req2, State}.

echo(<<"GET">>, undefined, Req) ->
	cowboy_req:reply(400, [], <<"Missing echo parameter.">>, Req);
echo(<<"GET">>, Echo, Req) ->
	cowboy_req:reply(200, [
		{<<"content-type">>, <<"text/plain; charset=utf-8">>}
	], Echo, Req);
echo(_, _, Req) ->
	%% Method not allowed.
	cowboy_req:reply(405, Req).
