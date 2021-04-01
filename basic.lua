print("Hello World!")

print(type("Hello world"))      --> string
print(type(10.4*3))             --> number
print(type(print))              --> function
print(type(type))               --> function
print(type(true))               --> boolean
print(type(nil))                --> nil
print(type(type(X)))            --> string

html = [[
<html>
<head></head>
<body>
    <a href="http://www.runoob.com/">菜鸟教程</a>
</body>
</html>
]]
print(html)

print("----斐波那契----")
function factorial1(n)
    if n == 0 then
        return 1
    else
        return n * factorial1(n - 1)
    end
end
-- Lua 中的变量全是全局变量，那怕是语句块或是函数里，除非用 local 显式声明为局部变量。
local name ="jack"

print(factorial1(5))
factorial2 = factorial1
print(factorial2(5))

function joke()
    c = 5           -- 全局变量
    local d = 6     -- 局部变量
end

joke()
print(c,d)          --> 5 nil

--[[
1.function()
end

2.do
end

3.for 
]]--

a,b = "1",2
c = a+b
print("c:",c)

--字符串连接..
str3="hello".."world"
print(str3)

i=1
while(i<10)
do 
    i=i+1
    print(i) 
end

print(i)
if (i<10)
then
    print(i,"小于10")
else
    print(i,"大于10")    
end

for i=10,1,-1 do
    print(i)
end

--pairs可以遍历表中所有的key，并且除了迭代器本身以及遍历表本身还可以返回nil;
--但是ipairs则不能返回nil,只能返回数字0，如果遇到nil则退出。它只能遍历到表中出现的第一个不是整数的key

myTable = {"jack","polly","marry",0,nil}
for k,v in pairs(myTable) do
    if v==nil
    then
        print("k",k)
    end    
    print(k,v)
end

--[ 变量定义 --]
a = 10
--[ 执行循环 --]
repeat
   print("a的值为:", a)
   a = a + 1
until( a > 15)

for i=10,15,1 do
    print("i的值为:", i)
end

-- 控制结构的条件表达式结果可以是任何值，Lua认为false和nil为假，true和非nil为真。要注意的是Lua中 0 为 true
--[ 0 为 true ]
if(0)
then
    print("0 为 true")
end

function max(num1,num2)
    if (num1>num2) then
        return num1
    else
        return num2    
    end
end

print("两值比较最大值为 ",max(10,4))

myprint = function(param)
    print("这是打印函数 -   ##",param,"##")
end

function add(num1,num2,functionPrint)
    result = num1 + num2
    -- 调用传递的函数参数
    functionPrint(result)
end
myprint(10)
-- myprint 函数作为参数传递
add(2,5,myprint)

--[[函数多返回值]]--
function ret(r1,r2)
    -- body
    return r1,r2
end

print("多返回值:",ret(10,20))
-- 可变参数,使用3个点表示...
function average( ... )
    print("第一个元素",select(1, ...))
    print("个数",select('#',...)) 
    -- body
    local s = 0
    local count ={...}  
    for i, v in ipairs{...} do   --> {...} 表示一个由所有变长参数构成的数组  
        s = s + v  
    end
    return s,#count
end
sum,count = average(1,2,3,4)
print("sum:",sum,"count:",count)

print("菜鸟教程网址长度 ",#"www.runoob.com" )

print(string.format( "hi %s","jack"))



function ArrT( ... )
    -- arr = {[0]=1,2,3,4} -- 指定索引从0开始，不然默认从1开始
    arr = {[0]=1,2,3,4}
    for k,v in pairs(arr) do
        print("k-v",k,v)
    end
    -- body
end
ArrT()

fruits = {"banana","orange","apple"}
-- 返回 table 连接后的字符串
print("连接后的字符串 ",table.concat(fruits))

-- 指定连接字符
print("连接后的字符串 ",table.concat(fruits,", "))

-- 指定索引来连接 table
print("连接后的字符串 ",table.concat(fruits,", ", 2,3))

-- 在末尾插入
table.insert(fruits,"mango")
print("索引为 4 的元素为 ",fruits[4])
table.remove(fruits)
-- 排序
table.sort(fruits)
print("排序后")
for k,v in ipairs(fruits) do
        print(k,v)
end

function tableT( ... )
    mT = {"name","age","sex","height"}
    for k,v in pairs(mT) do
        print("k-v",k,v)   
    end
end
tableT()

--error处理

local function add(a,b)
    assert(type(a) == "number", "a 不是一个数字")
    assert(type(b) == "number", "b 不是一个数字")
    return a+b
 end
 add(10)