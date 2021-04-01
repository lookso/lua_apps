### 1.lua 包管理
```
LuaRocks支持Lua的多个版本,可以要求它在运行时使用另一个版本
使用“--lua dir”标志
luarocks --lua-dir=/usr/local/opt/lua@5.1 install say
```
安装lua的mysql扩展
```
luarocks install luasql-mysql MYSQL_DIR=/usr/local/opt/mysql@5.7/ MYSQL_INCDIR=/usr/local/Cellar/mysql@5.7/5.7.23/include/mysq
```
安装csjon
```
安装cjson需要先搜索一下安装包

luarocks search cjson

luarocks install lua-cjson

# 如果你是lua5.3以上
luarocks remove lua-cjson
luarocks install lua-cjson 2.1.0-1

```