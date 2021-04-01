-- 创建一个元表
local mt = {};
mt.__add = function(t1, t2)
    print("两个table相加的结果就是...神经病啊！table有什么好相加的啊！");
end
local t1 = {};
local t2 = {};

-- 给两个table设置新的元表
setmetatable(t1, mt);
setmetatable(t2, mt);

-- 进行加法操作
local result = t1 + t2;

mytable = setmetatable({key1 = "value1"}, { __index = { key2 = "metatablevalue" } })
print(mytable.key1,mytable.key2)

print("----__newindex------")
mymetatable = {}
mytable = setmetatable({key1 = "value1"}, { __newindex = mymetatable })

print(mytable.key1)

mytable.key3 = "新值2"
print(mytable.key3,mymetatable.key3)

mytable.key1 = "新值1"
print(mytable.key1,mymetatable.key1)

print("-----__tostring-----")
mytable1 = setmetatable({ 10, 20, 30 }, {
    __tostring = function(mytable1)
      sum = 0
      for k, v in pairs(mytable1) do
                  sum = sum + v
          end
      return "表所有元素的和为 " .. sum
    end
  })
  print(mytable1)

print("------__add----")
-- 计算表中最大值，table.maxn在Lua5.2以上版本中已无法使用
-- 自定义计算表中最大键值函数 table_maxn，即计算表的元素个数
function table_maxn(t)
    local mn = 0
    for k, v in pairs(t) do
        if mn < k then
            mn = k
        end
    end
    return mn
end

-- 两表相加操作
mytable = setmetatable({ 1, 2, 3 }, {
  __add = function(mytable, newtable)
    for i = 1, table_maxn(newtable) do
      table.insert(mytable, table_maxn(mytable)+1,newtable[i])
    end
    return mytable
  end
})

secondtable = {4,5,6}

mytable = mytable + secondtable
        for k,v in ipairs(mytable) do
print(k,v)
end