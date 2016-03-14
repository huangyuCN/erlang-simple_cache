# erlang-simple_cache
Erlang and OTP in Action 练习，创建一个带过期时间的缓存服务器 
通过阅读Erlang and OTP in Action ，实现一个带过期时间的缓存服务器
启动方式：
1.使用erlc将文件编译到ebin目录
  erlc -o ebin src/*.erl
2.启动erl
  erl
3.运行程序
  applicaiton:start(simple_cache).
4.测试存取数据
  simple_cache:insert("a","A").
  返回：true
  simple_cache:lookup("a").
  返回：{ok,"A"}
  simple_cache:delete("a").
  返回：ok
