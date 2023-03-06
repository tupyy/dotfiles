#!/usr/bin/lua

local fan_info = "/proc/acpi/ibm/fan"

-- see if the file exists
local function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
local function read(file)
  if not file_exists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

local function split(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

-- transform = function(value)
--   local cpu = tonumber(value);
--   return string.format("%.2f%%", cpu)
-- end

local function firstToUpper(str)
  return (str:gsub("^%l", string.upper))
end

local function get_fan_info()
  local output = {}
  if file_exists(fan_info) then
    local content = read(fan_info)
    for k, v in pairs(content) do
      local parts = split(v, ":")
      output[k] = {
        name = parts[1];
        value = parts[2]:gsub("%s+", "");
      }
    end
  end
  return output
end

local function print_value(key, value, color)
  print(string.format("${goto %s}%s: ${goto 130}${color %s}%s${color white}", 40, firstToUpper(key), color, value))
end

for _, v in pairs(get_fan_info()) do
  if (v.name ~= "commands") then
    local color = "white"
    if (v.name == "speed") then
      local speed = tonumber(v.value)
      color = "green"
      if (speed > 3000 and speed < 4000) then
        color = "yellow"
      elseif (speed > 4000) then
        color = "red"
      end
    end
    print_value(v.name, v.value, color)
  end
end
