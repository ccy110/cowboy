%% Feel free to use, reuse and abuse the code in this file.

%% @doc Upload handler.
-module(upload_handler).

-export([init/2]).
-export([handle/2]).

init(Req, Opts) ->
	{http, Req, Opts}.

handle(Req, State) ->
	{ok, Headers, Req2} = cowboy_req:part(Req),
	{ok, Data, Req3} = cowboy_req:part_body(Req2),
	{file, <<"inputfile">>, Filename, ContentType, _TE}
		= cow_multipart:form_data(Headers),
	io:format("Received file ~p of content-type ~p as follow:~n~p~n~n",
		[Filename, ContentType, Data]),
	{ok, Req3, State}.
