-- test_module.lua 文件
-- module 模块为上文提到到 module.lua
require("./mod/t")
 
print(module.constant)
print(module.name)
 
module.func3()