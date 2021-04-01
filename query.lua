lzh={}
lzh["age"]=21
print(lzh["age"])
print(lzh.age) --不用带引号
print(lzh)

task = {["age"]=21}
print(task.age)

print("------")
local function args(obj,...)
    print("obj",obj)
    if next({...})~=nil then
        for _, v in ipairs{...} do
            print(v)
        end
    else
        print("empty var")
    end
end

args(10, 20, 30)

local num=1
local a="2"
if tonumber(a) >num then
    print("wocao")
else
    print("nono")
end
