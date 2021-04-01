local x = 2323
local collection = {
  height = 32434,
  hats = {
    "tophat",
    "bball",
    "bowler"
  }
}
for k,v in pairs(collection) do 
    if k=="hats" then
        for kk,vv in pairs(v) do
            print("kk-vv",kk,vv)
        end
    end
end

my_func = function(a)
  return x + a
end
print(my_func(100))