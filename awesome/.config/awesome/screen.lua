#!/usr/bin/lua

local screens = {}

local pattern = ".*\\d.*\\+\\*?([-a-zA-Z0-9]+)\\s(\\d+)\\/(\\d+)x(\\d+)\\/(\\d+)\\+(\\d+)"
local xrandr = "xrandr --listactivemonitors"

local function exec(cmd)
    local result = io.popen(cmd)
    if (result == nil) then
        return "", error("invalid result")
    end
    local output = result:read("*all")
    result:close()
    return output, nil
end

local function parse(output)
    for str in string.gmatch(output, "(.-)\n") do
        for token in string.gmatch(str, pattern) do
            print(token)
        end
    end
end

local output = exec(xrandr)
parse(output)
