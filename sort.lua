local test={1,5,2,6,8,9,10,3}
table.sort(test)
for i,v in ipairs(test) do
	print(v)
end

local data = {['1597234320']={['tip']="上课",['who']='我哥'},['1597234320']={['tip']="上课",['who']='我'}}
-- [{"1597234320":{"tip":"上课","who":"我哥"}},{"1597234320":{"tip":"上课","who":"我"}}]

print(data[1])