--local lua_util = require("lua_util")
--local table = {}
local function ptable(t, h, d, printfunc)
    printfunc = printfunc or print
    if d and d > max_deep_for_ptable then
        printfunc("max_deep_for_ptable is " .. max_deep_for_ptable .. "got " .. d)
        d = max_deep_for_ptable
    end
    local num = 0
    local function _ptable(_t, _h, _d)
        for i, v in pairs(_t) do
            -- print("-+-+-+-", _d, i, v, type(i), type(v))
            printfunc(string.rep("	", _d) .. (tostring(i) or "ERROR") .. "	" .. (tostring(v) or "ERROR"))
            num = num + 1
            if type(v) == "table" and _h > _d then
                _ptable(v, _h, _d + 1)
            end
        end
    end
    printfunc(tostring(t))
    if type(t) == "table" then
        _ptable(t, h or 0, d or 0)
    end
    printfunc("all value number: " .. num)
end
table.ptable = ptable
--local a = {s1=1,s2=2,s3={x=1,y=2,z={p=33,q=44}}}
--
--table.ptable(a,21)

--a = {}
--a[10000] = 1
--print(#a)
--print(table.maxn(a))
----对于 and  如果第一个操作数为假，返回第一个操作数；不然返回第二个操作数
--b = 1 and nil
----对于or 如果第一个操作数为真，返回第一个；不然返回第二个操作数
--local c = 1 or 2
----print(b)
----print(c)
--local v = {id=5}
--b = type(v) and v.id==5
--print(b)

-- (a and b) or c,  a为真，返回b or c , b为真， 返回b, b为假， 返回c; b为真， 返回b   ||   a为假， 返回 a or c , 返回c
--max = (x>y) and x or y ,   x>y真， 返回x or y，返回x || （x>y)为假， 返回 （x>y) or y， 返回y

--local list = nil
----模拟链表写入
--for line in io.lines() do
--    if type(line) == 'string' and line == 'exit' then
--        break
--    end
--    list = {next=list,value=line}
--end
--
----模拟链表读取
--while list do
--    print(list.value)
--    list = list.next
--end

-- cc 相当于 有这样几个键，'color', 'tick', 'point', 1, 2, 3 ,只不过1，2,3 键值都是一个记录型列表
--local cc = {color='blue',tick=2,point=4,{x=1,y=10},{x=-10,y=2},{x=-10,y=23}}

--local dd = {['color']='blue',['tick']=2,['point']=4,[1]={x=1,y=10},[2]={x=-10,y=2},[3]={x=-10,y=23}}
--for k,v in pairs(dd) do
--    print(k,v)
--end
--
--print(cc[1].color)  --长度只算 列表的，不算字典的  此处输出3
--print(#dd)
--
--local dd = {['+'] = 'add',['-']='sub',['*']='mul',['/']='div'}
--local i = 20 ; s = '-'
--a = {[i+0]=s,[i+1]=s .. s, [i+2]= s .. s ..s }
--
--print(dd[s])
--print(a[22])
--
--do
--    local a , b = 1,10
--end
--
--do
--    print(a)  -- nil
--    local a
--    print(a)     --nil
--
--end
--print(a,b)   --b全局，则  nil,10, 否则nil,nil
--print(math.huge)
--for i=1,math.huge do
--    print(i)
--end


--function foo()
--    return
--end
--foo()

--print([[hello]])

function pt(ta)
    for k, v in pairs(ta) do
        print(k, v)
    end
end
-- 当函数实参是 字面字符串 或者是table构造式的话，可以不用 () 的形式调用
--pt {a=5,b=2}

function pt2()
    return 1, 2, 3
end
-- 函数返回值作为实参，不是出于最后的位置， 则哪怕返回多个值，也只是取第一个
--print(pt2(),4)   -- 1 4
--print(4,pt2())  -- 4 1 2 3
--
--t = {pt2()}
--for _,v in pairs(t) do
--    print(v)
--end
--
--function pt3()
--
--end
--local x = pt3()
--print(pt3())
--print(x)

--local f = { 10, 20, 30, 40, 50, { 60, 80 }, a = 5 }
--local ff = unpack(f)
--print(ff)
--print(unpack(f))  --unpack()函数接受table作为参数， 返回table 各项的值
--
--function gog(...)
--    print(select('#', ...))
--end
--function gog2(...)
--    local f = select(1,...)
--    print(f)
--    print(select(3, ...))
--    print(select('#', ...))
--end
--gog(1,2,3)
--gog2(1,2,3,nil,5)
--function gog3(...)
--    for i=1,select('#',...) do
--        local n = select(i,...)
--        print(n)
--    end
--end
--gog3(1,2,3,nil,4,false,5,6)


--
--local foo = function (x)
--    print('hello',x)
--end
--
--foo(2)

-- 匿名函数
--network = {
--    {name="a",ip="11.11.22.33"},
--    {name="b",ip="11.11.22.33"},
--    {name="d",ip="11.11.22.33"},
--    {name="c",ip="11.11.22.33"},
--}
--table.sort(network,function (a,b) return a.name < b.name end)
--
--table.ptable(network,6)

-- 转化传统函数的功能(弧度转角度)
--local oldSin = math.sin   --将函数赋给其他变量，然后更改这个函数的作用
--math.sin = function(x) return oldSin(x*math.pi/180) end

--沙盒 【此时在do...end语句块外面无法访问到正常功能的math.sin】
--do
--    local oldSin = math.sin
--    local k = math.pi / 180
--    math.sin = function(x)
--        return oldSin(x * k)
--    end
--end
--
--
---- 沙盒之 【检查文件安全性】应用
--do
--    local newOpen = io.open
--    --权限检查
--    local isOk = function()
--        print('ok')
--    end
--
--    io.open = function()
--        if isOk() then
--            return newOpen()
--        else
--            return "permission deny!!!"
--        end
--    end
--
--end
--
----易错情形 函数体内的fact(x-1)实际上会去找全局变量fact,因为此时局部变量local fact 尚未定义完成，这里就会出错
--local fact = function(x)
--    if x == 1 then
--        return 1
--    else
--        return x * fact(x - 1)
--    end
--
--end
--
----易错情形改正
--local fact
--fact = function(mx)
--    mx = mx or 0   --写 0 是为了好玩，不符合题意
--    if mx == 1 then
--        return 1
--    else
--        return mx * fact(mx - 1)
--    end
--end
----易错情形改正2
--local function fact(mx)
--    mx = mx or 0   --写 0 是为了好玩，不符合题意
--    if mx == 1 then
--        return 1
--    else
--        return mx * fact(mx - 1)
--    end
--end


-- 面向对象
--Account = {a = 10}
--function Account.pay(money)
--    Account.a = Account.a - money
--end
--local pay = Account.pay
--print(Account.a)
--pay(5)
--print(Account.a)
---- 此时将Account这个对象赋给其他值
--local tt = Account
--Account = nil
--tt.pay(5)

-- 改进
--Account = {a = 10}
--function Account.pay(self,money)
--    self.a = self.a - money
--    print(self.a)
--end
--local tt = Account
--Account.pay(Account,2)
--tt.pay(tt,3)
--
--
---- tt2 pay引用对象方法
--tt2 = {a = 20,pay = Account.pay }
--tt2.pay(tt2,51)

--改进2
--Account = {a = 10}
--function Account:pay(money)
--    self.a = self.a - money
--    print(self.a)
--end
--
--a = Account


-- 表充当的对象  和  : 语法
--Account = {
--    a = 10, -- 账户存款
--    --取钱方法
--    withdraw = function(self, money)
--        self.a = self.a - money
--    end
--}
----存钱方法
--function Account:deposit(money)
--    self.a = self.a + money
--end
--
----取钱
--Account:withdraw(7)
----存钱
--Account.deposit(Account,33)
--print(Account.a)    -- 10-7+33 = 36
--

-- 原型操作
--a = {
--    aa = 2
--}
--b = {
--    bb = 3,
--    addAa = function(aa)
--        aa = aa+1
--        print(aa)
--        return aa
--    end
--}
--此时如果需要a执行addAa的操作
--a.addAa(a.aa) --错误
--setmetatable(a,{__index = b})
--a.addAa(a.aa)

--Account = {account=11}
--function Account:new(o)
--    o = o or {}
--    --指定父表
--    setmetatable(o,self)
--    --自己的父表为自己
--    self.__index = self
--    --返回这个对象
--    return o
--end
--function Account:deposit()
--    return "dd"
--end
--function Account:printAcc()
--    print(self.account)
--end
----
------ a指定父表
----a = Account:new()
----a.printAcc()
----
----
--a = Account:new({account=8})
--a:printAcc()
--


--Account = {}
--
--
local function search(k, plist)
    for i = 1, #plist do
        local v = plist[i][k]
        if v then
            return v
        end
    end
end
--
--
--function createClass(...)
--    local c = {}
--    local parents = {...}
--    setmetatable(c,{__index=function(t,k) return search(k,parents) end})
--    c.__index = c
--    function c:new(o)
--        o = o or {}
--        setmetatable(o,c)
--        return o
--    end
--    return c
--end
--
--
----local cc = createClass(1,2,3)
----local dd = cc:new()
--
--
--Named = {}
--function Named:getv()
--    return self.name
--end
--function Named:setv(v)
--    self.name = v
--end
--
--
---- 经典例子
--NamedAccount = createClass(Account,Named)
--account = NamedAccount:new({name='Paul'})
--print(account:getv())

--setmetatable(c,{__index=function (t,k)
--    local v= search(k,parents)
--    t[k] = v
--    return v
--
--end})



-- 私密性封装
--function NewAcc(initial)
--    local pM = function()
--        print("我是私有的方法")
--    end
--    local self = {balance=initial or 100,privateMethod=pM,privateNoNameMethod=function () print "helloworld" end}
--
--    local withdraw = function (money)
--        self.balance = self.balance - money
--    end
--    local deposit = function (money)
--        self.balance = self.balance + money
--    end
--    local showAccount = function ()
--        print(self.balance)
--    end
--    local function showPrivateNoNameMethod()
--        self.privateMethod()
--        self.privateNoNameMethod()
--    end
--    return {
--        withdraw = withdraw,
--        deposit = deposit,
--        showAccount = showAccount,
--        showPrivateNoNameMethod = showPrivateNoNameMethod
--    }
--
--end
--
--
--local ex = NewAcc()
--ex.withdraw(556)
--ex.showAccount()
--ex.showPrivateNoNameMethod()

-- 迭代器也是 单一函数对象   （单一方法实现  "对象" ）
--function getObje(arg)
--    return function(action,v)
--        if action == "get" then
--            return arg
--        elseif action == "set" then
--            arg = v
--            return arg
--        else
--            error("错误")
--        end
--
--    end
--end
--
--print(getObje("3")("set个",6))


--
--
--local ff = {[40]=1,[70]=2,[150]=3}
--print(ff[1])

--local INTER = 0
--local OUTER = 1
--local sa = {
--    [INTER] = function(self)
--        print(self)
--        print("inter")
--    end,
--    [OUTER] = function(self)
--        print("outer")
--    end
--}
--
--
--sa[INTER](sa)






