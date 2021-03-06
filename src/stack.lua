local _m = {}

_m.Stack = { len = 0, mem = {} }
function _m.Stack:push(value)
    self.len = self.len + 1
    self[self.len] = value
end

function _m.Stack:pop()
    if self.len == 0 then return nil end
    local val = self[self.len]
    self[self.len] = nil
    self.len = self.len - 1
    return val
end

function _m.Stack:new()
    return setmetatable({len = 0, mem = {}}, self)
end

_m.Stack.__index = _m.Stack

return _m
