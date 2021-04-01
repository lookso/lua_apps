function FileRead()
    local file = io.open("test.json","r")
    local json = file:read("*a");
    file:close()
    return json
end
local cjson = require "cjson"
local file = FileRead()
local json = cjson.decode(file)

for i,w in ipairs(json.configs) do
    print("user:"..w.user)
    print("password:"..w.password)
end
print("str:"..json.str)