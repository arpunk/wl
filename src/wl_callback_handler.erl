-module(wl_callback_handler).

-export([ init/2
        , handle_event/3
        ]).

init(_Version, {Pid, Data}) ->
    {ok, {Pid, Data}};

init(_Version, Pid) ->
    {ok, Pid}.


handle_event(done, [CallbackData], {Pid, Data}) ->
    Pid ! {done, self(), CallbackData, Data},
    ok;

handle_event(done, [CallbackData], Pid) ->
    Pid ! {done, self(), CallbackData},
    ok.