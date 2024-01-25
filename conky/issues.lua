#!/usr/bin/lua

require 'luarocks.loader'
local lunajson = require 'lunajson'
local statusInProgress = "In Progress"
local statusToDo = "To Do"
local statusCodeReview = "Code Review"

local function create_curl_req(token)
    return "curl -s -G -H \"Accept: application/json\" -H \"Authorization: Bearer " ..
        token ..
        "\" " ..
        "--data-urlencode \"jql=assignee=ctupangi\\u0040redhat.com and status!=6\" https://issues.redhat.com/rest/api/latest/search"
end

local function format(col_def, data)
    local line = string.format("${goto %s}%s", col_def.key.offset, data.key)
    -- status
    line = string.format("%s${goto %s}%s", line, col_def.status.offset, data.status);
    -- summary
    line = string.format("%s${goto %s}%s", line, col_def.summary.offset, data.summary);
    if data.status == statusInProgress then
        return "${color yellow}" .. line .. "${color white}"
    elseif data.status == statusCodeReview then
        return "${color green}" .. line .. "${color white}"
    end

    return line
end

local function new_definition(x0)
    local c = {}
    c.key = {
        header = "Issue",
        offset = x0,
    }
    c.status = {
        header = "Status",
        offset = x0 + 150,
    };
    c.summary = {
        key = "fields.summary",
        header = "Summary",
        offset = x0 + 300,
    }
    return c
end

local function exec(cmd)
    local result = io.popen(cmd)
    if (result == nil) then
        return "", error("invalid result")
    end
    local output = result:read("*all")
    result:close()
    return output, nil
end

local function extract(data)
    local extracted_data = {}
    for _, issue in ipairs(data.issues) do
        local d = {
            key = issue.key,
            status = issue.fields.status.name,
            summary = issue.fields.summary
        }
        table.insert(extracted_data, d)
    end
    table.sort(extracted_data, function(a, b)
        local aScore, bScore = 0, 0
        if a.status == statusToDo then
            aScore = 2
        elseif a.status == statusInProgress then
            aScore = 1
        end
        if b.status == statusToDo then
            bScore = 2
        elseif b.status == statusInProgress then
            bScore = 1
        end
        return aScore > bScore
    end)
    return extracted_data
end

local function format_conky_table(col_definition, data)
    local format_output = function(x, offset)
        return string.format("${goto %s}", x + offset)
    end

    local table_string = "Issue" ..
        string.format("${goto %s}Status", col_definition.status.offset) ..
        string.format("${goto %s}Summary", col_definition.summary.offset)
    for _, d in ipairs(data) do
        local line = "";
        line = format(col_definition, d)
        table_string = string.format("%s\n%s", table_string, line)
    end
    return table_string
end

local pipelines_data = exec(create_curl_req("some token"))
local data = extract(lunajson.decode(pipelines_data))

local def = new_definition(550)
print(format_conky_table(def, data))
