%%%-------------------------------------------------------------------
%%% @author HuangYu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 三月 2016 下午4:54
%%%-------------------------------------------------------------------
-module(simple_cache).
-author("HuangYu").

%% API
-export([insert/2,insert/3,lookup/1,delete/1]).

insert(Key,Value,LeaseTime)->
  case sc_store:lookup(Key) of
    {ok,Pid} -> sc_element:replace(Pid,Value);
    {error,_}->
      {ok,Pid} = sc_element:create(Value,LeaseTime),
      sc_store:insert(Key,Pid)
  end.

insert(Key,Value)->
  case sc_store:lookup(Key) of
    {ok,Pid}->sc_element:replace(Pid,Value);
    {error,_}->
      {ok,Pid} = sc_element:create(Value),
      sc_store:insert(Key,Pid)
  end.

lookup(Key)->
  try
    {ok,Pid}=sc_store:lookup(Key),
    {ok,Value}=sc_element:fetch(Pid),
    {ok,Value}
  catch
    _Class:_Exception ->
      {error,not_found}
  end.

delete(Key) ->
  case sc_store:lookup(Key) of
    {ok,Pid} -> sc_element:delete(Pid);
    {error,_Reason} -> ok
  end.