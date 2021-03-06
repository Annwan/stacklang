#!/usr/bin/env lua

local bi = require"builtins"
local stack = require"stack"


local function split(str)
    local tokens = {}
    for t in str:gmatch("%S+") do
        tokens[#tokens + 1] = t
    end
    return tokens
end

if arg[1] ~= nil then
    io.input(arg[1])
end

local prog = io.read("*a")
prog = split(prog)

local s = stack.Stack:new()

for n,t in ipairs(prog) do
    if bi[t] == nil then
        s:push(tonumber(t) or t)
    else
        bi[t](s)
    end
end

for i, v in ipairs(s) do
    print(string.format("%s\t", tostring(v)))
end
for k, v in pairs(s.mem) do
    print(tostring(k), tostring(v))
end