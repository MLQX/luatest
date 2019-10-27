-- 迭代器和closure
-- 迭代器是一种函数，每次调用这个函数，就返回集合中的下一个元素
--do
--    local a = {1,2,3}
--end

--function f(a)
--    local i = 0
--    return function() i = i + 1; return a[i]; end
--end
--a = {4,5,6}
--iter = f(a)
--print(type(f(a)))
--while true do
--    local i = iter()
--    if i == nil then break end
--end
--

--
--for j in f() do
--    print(j)
--end


--  next ( t, k) 的使用情形  ，  t为表，k为键
--local ff = {'a','bc','def'}
--a,b = next(ff,1)
--print(a,b)




-- 这个函数
local function getNext(list, node)
    if not node then
        return list
    else
        return node.next
    end
end


--in： list,返回三个值， 第一个是函数，第二个是链表头地址， 第三个是nil
function traverse(list)
    return getNext, list, nil
end

--call
list = nil
for line in io.lines() do
    -- var为值， next为地址
    list = {var=line,next=list}
end

for node in traverse(list) do
    print(node.val)
end







