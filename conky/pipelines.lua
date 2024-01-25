#!/usr/bin/lua

require 'luarocks.loader'
local lunajson = require 'lunajson'

local pattern = "(%d+)%-(%d+)%-(%d+)T(%d+):(%d+):(%d+)%.(%d+)Z"

local function create_curl_req(token)
    return "curl -s -H \"PRIVATE-TOKEN: " ..
        token .. "\" " .. "https://gitlab.cee.redhat.com/api/v4/projects/61167/pipelines"
end

local x = 550;
local columns_def = {
    [1] = {
        key = "ref",
        header = "Pipeline",
        offset = 0,
    },
    [2] = {
        key = "status",
        header = "Status",
        offset = 430,
        transform = function(value)
            local color = "${color white}"
            if value == "success" then
                color = "${color green}"
            elseif value == "running" then
                color = "${color yellow}"
            elseif value == "failed" then
                color = "${color red}"
            end
            return color .. value .. "${color white}"
        end
    },
    [3] = {
        key = "created_at",
        header = "Created at",
        offset = 560,
        transform = function(value)
            local xyear, xmonth, xday, xhour, xminute = value:match(pattern)
            return xday .. "/" .. xmonth .. "/" .. xyear .. " " .. xhour .. ":" .. xminute
        end
    },
    [4] = {
        key = "updated_at",
        header = "Updated at",
        offset = 780,
        transform = function(value)
            local xyear, xmonth, xday, xhour, xminute = value:match(pattern)
            return xday .. "/" .. xmonth .. "/" .. xyear .. " " .. xhour .. ":" .. xminute
        end
    },
}

local function exec(cmd)
    local result = io.popen(cmd)
    if (result == nil) then
        return "", error("invalid result")
    end
    local output = result:read("*all")
    result:close()
    return output, nil
end

local function format_conky_table(initial_offset, columns, data)
    local format_output = function(x, offset)
        return string.format("${goto %s}", x + offset)
    end

    local header = ""
    for _, c in ipairs(columns) do
        header = string.format("%s%s%s", header, format_output(initial_offset, c.offset), c.header)
    end

    local table_string = string.format("%s", header)
    for _, row in ipairs(data) do
        local line = "";
        for _, column in ipairs(columns_def) do
            local value = row[column.key];
            if (value ~= nil) then
                if (column.transform ~= nil) then
                    value = column.transform(value)
                end
                line = string.format("%s%s%s", line, format_output(initial_offset, column.offset), value);
            end
        end
        table_string = string.format("%s\n%s", table_string, line)
    end
    return table_string
end

local function format_console(data)
    local header = ""

    local table_string = ""
    for _, row in ipairs(data) do
        local line = string.format("%s", row);
        table_string = string.format("%s\n%s", table_string, line)
    end
    return table_string
end

local runtime = arg[1] or "conky"
local format
if (runtime == "conky") then
    format = format_conky_table
else
    format = format_console
end

local pipelines_data = exec(create_curl_req("token"))
local data = lunajson.decode(pipelines_data)

if #data > 5 then
    print(format(x, columns_def, { table.unpack(data, 1, 5) }))
else
    print(format(x, columns_def, data))
end
