#!/usr/bin/lua
require 'luarocks.loader'
local lunajson = require 'lunajson'
local luatz = require 'luatz'
local calendars = { "ctupangi@redhat.com", "c_6rdqeh7akn6qo13se5dlk8hfqg@group.calendar.google.com" }
local calgo = "/home/cosmin/projects/calgo/calgo list 1 --calendar_id"
local get_tz = require "luatz.tzcache".get_tz
local gettime = require "luatz.gettime".gettime
local now = get_tz():localize(gettime())
local offset = 40

local function get_events(cmd)
    local result = io.popen(cmd)
    if (result == nil) then
        return "", error("invalid calendar cmd")
    end
    local output = result:read("*a")
    result:close()
    return output, nil
end

local function parse(events)
    local r = {}
    local json = lunajson.decode(events)
    for i = 1, #json do
        if (json[i].date ~= "") then
            r[#r + 1] = {
                date = luatz.parse.rfc_3339(json[i].date);
                summary = string.sub(json[i].summary,0, 30);
            }
        end
    end
    return r
end

-- get_first_event returns the next event
local function get_first_event(event)
    for _, v in ipairs(event) do
        if now < v.date:timestamp() then
            event = string.format("%s - %s", os.date("%H:%M", os.time(v.date)), v.summary)
            return event
        end
    end
end

local function get_all_events(event)
    local function trim(s)
        return (s:gsub("^%s*(.-)%s*$", "%1"))
    end

    local function is_next(e)
        if now < e.date:timestamp() then
            return true
        end
    end

    local events = ""
    local next_found = false
    for _, v in ipairs(event) do
        local line = ""
        if is_next(v) and not next_found then
            line = string.format("${goto %s}${color green}%s - %s${color white}", offset, os.date("%H:%M", os.time(v.date)),
                trim(v.summary))
            next_found = true
        else
            line = string.format("${goto %s}%s - %s", offset, os.date("%H:%M", os.time(v.date)), trim(v.summary))
        end
        events = string.format("%s\n%s", events, line)
    end
    return trim(events)
end

local output = arg[1] or "polybar"
local e = {}
for _, v in pairs(calendars) do
    local cmd = string.format("%s %s -ojson", calgo, v)
    local events, err = get_events(cmd)
    if (err ~= nil) then
        print(err)
        os.exit(1)
    end
    for _, vv in pairs(parse(events)) do
        e[#e + 1] = vv
    end
end

-- sort table
table.sort(e, function(e1, e2) return e1.date:timestamp() < e2.date:timestamp() end)

if output == "conky" then
    print(get_all_events(e) or "No upcoming events")
    os.exit(0)
end

print(get_first_event(e) or "No upcoming events")
