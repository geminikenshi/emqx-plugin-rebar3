-module(online_plugin_app).

-behaviour(application).

-emqx_plugin(?MODULE).

-export([ start/2
        , stop/1
        ]).

start(_StartType, _StartArgs) ->
    {ok, Sup} = online_plugin_sup:start_link(),
    online_plugin:load(application:get_all_env()),
    {ok, Sup}.

stop(_State) ->
    online_plugin:unload().
