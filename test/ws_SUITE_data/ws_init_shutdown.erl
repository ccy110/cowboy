%% Feel free to use, reuse and abuse the code in this file.

-module(ws_init_shutdown).

-export([init/2]).

init(Req, _) ->
	{shutdown, cowboy_req:reply(403, Req), undefined}.
