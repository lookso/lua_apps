local tab = {}
-- table是否为空
if next(tab)==nil then
    print("tab is nil")
else
    for k,v in ipairs(tab) do
        print("tab k,v",k,v)
    end
end

local complay = {
    ceo = {},
    itech ={
        ops={names={"jack","toms","polly"}}
    }
}
local names=""
for _,name in ipairs(complay.itech.ops.names) do
    names= name.."|"..names
end
print("names:",names)


function Fbnq(n)
    if n ==1 or n==2 then
        return n
    end
    return Fbnq(n-1)+(n-2)
end

print("n",Fbnq(10))


print("---------------------")

local tb = {}

tb['a']=1
tb['c']=2
tb[2]=2
tb[1]=2
print(#tb)

local colorTable = {}

colorTable[1] = "blue"
colorTable['v']=123
colorTable[2] = "red"
colorTable[3] = "yellow"
colorTable[4] = "green"
colorTable[5] = "purple"

print(#colorTable)