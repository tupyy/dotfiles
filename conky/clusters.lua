#!/usr/bin/lua

require 'luarocks.loader'
local lunajson = require 'lunajson'

local function create_ocm_req(cluster_type)
  return "ocm get " .. string.format("/api/osd_fleet_mgmt/v1/%s", cluster_type)
end

local rpad =
    function(s, l, c)
      local res = s .. string.rep(c or ' ', l - #s)

      return res, res ~= s
    end

local x = 550;
local columns_def = {
  [1] = {
    key = "id";
    header = "Id";
    offset = 0;
  };
  [2] = {
    key = "status";
    header = "Status";
    offset = 250;
  };
  [3] = {
    key = "sector";
    header = "Sector";
    offset = 450;
  };
  [4] = {
    key = "region";
    header = "Region";
    offset = 750;
  };
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

local function extract_data(output)
  local data = lunajson.decode(output)
  output = {}
  for _, c in pairs(data["items"]) do
    table.insert(output, c)
  end
  return output
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
  for _, cluster in ipairs(data) do
    local line = "";
    for _, column in ipairs(columns_def) do
      local value = cluster[column.key];
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
  for _, cluster in ipairs(data) do
    local line = string.format("%s\t%s\t\t%s\t%s", cluster.id, rpad(cluster.status, 10), rpad(cluster.sector, 10),
    cluster.region);
    table_string = string.format("%s\n%s", table_string, line)
  end
  return table_string
end

local data = extract_data(exec(create_ocm_req(arg[1])))
print(format_console(data))
