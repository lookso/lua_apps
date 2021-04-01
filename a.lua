local a={}

a["time"] = { ["value"] = {["begin"]={["time"]=123} }}

print(a.time.value.begin.time)


local tbl = {[10] = 40303, [3] = 40304, [5] = 40305, [7] = 40301, [9] = 40302}

function pairsByKeys(t, f)
    local a = {}
    for n in pairs(t) do a[#a+1] = n end
    table.sort(a, f)
    local i = 0          -- 迭代器变量
    return function()    -- 迭代器函数
        i = i + 1
        return a[i], t[a[i]]
    end
end

for name, line in pairsByKeys(tbl) do
    print(name, line)
end