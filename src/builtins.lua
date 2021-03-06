local _m = {}

--- make a 1 parameter fonction with 1 return value operate on the stack
---@param f function
---@return function
local function stackify1_1(f)
    return function (stack)
        local a = stack:pop()
        stack:push(f(a))
    end
end

--- make a 2 parameter fonction with 1 return value operate on the stack
---@param f function
---@return function
local function stackify2_1(f)
    return function (stack)
        local a1 = stack:pop()
        local a2 = stack:pop()
        stack:push(f(a1, a2))
    end
end

_m["+"] = stackify2_1(function (a, b) return a + b end)
_m["-"] = stackify2_1(function (a, b) return a - b end)
_m["*"] = stackify2_1(function (a, b) return a * b end)
_m["/"] = stackify2_1(function (a, b) return a / b end)
_m["dup"] = function (stack)
    local a = stack:pop()
    stack:push(a)
    stack:push(a)    
end

_m["floor"] = stackify1_1(math.floor)
_m["sqrt"] = stackify1_1(math.sqrt)
_m["sin"] = stackify1_1(math.sin)
_m["cos"] = stackify1_1(math.cos)
_m["sto"] = function (stack)
    local varname = stack:pop()
    local varval = stack:pop()
    stack.mem[varname] = varval
end

_m["rcl"] = function (stack)
    local varname = stack:pop()
    stack:push(stack.mem[varname])
end
return _m