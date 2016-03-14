%%%-------------------------------------------------------------------
%%% @author HuangYu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 三月 2016 下午3:41
%%%-------------------------------------------------------------------
{application, simple_cache, [
  {description, "A simple caching system"},
  {vsn, "0.1.0"},
  {modules,[sc_app, sc_sup]},
  {registered, [sc_sup]},
  {applications, [
    kernel,
    stdlib
  ]},
  {mod, {sc_app, []}},
  {env, []}
]}.