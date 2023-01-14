#!/usr/bin/lua

require 'luarocks.loader'
local lunajson = require 'lunajson'

local nodes= {"fedorasrv:9100"}
local jobs= {"fedorasrv"}

local function uptime_query(node, job)
  return string.format("node_time_seconds{instance=\"%s\",job=\"%s\"} - node_boot_time_seconds{instance=\"%s\",job=\"%s\"}",node,job, node, job);
end

local function cpu_query(node, job)
  return string.format("(sum by(instance) (irate(node_cpu_seconds_total{instance=\"%s\",job=\"%s\", mode!=\"idle\"}[10m])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"%s\",job=\"%s\"}[10m])))) * 100",node,job, node, job);
end

local function memory_query(node, job)
  local totalMem = string.format("node_memory_MemTotal_bytes{instance=\"%s\",job=\"%s\"}", node, job)
  local freeMem = string.format("node_memory_MemFree_bytes{instance=\"%s\",job=\"%s\"}", node, job);
  local cachedMem = string.format("node_memory_Cached_bytes{instance=\"%s\", job=\"%s\"}",node, job);
  return string.format("((%s - %s -%s) / (%s)) * 100", totalMem,freeMem, cachedMem, totalMem);
end

local function create_curl_req(query)
  return "curl -s --data-urlencode 'query=" .. query .. "' http://localhost:7090/api/v1/query"
end

local x = 550;
local columns_def = {
    [1] = {
        key = "host";
        header = "Host";
        offset = 0;
    };
    [2] = {
        key = "cpu";
        header = "CPU";
        offset = 150;
        transform = function (value)
          local cpu = tonumber(value);
          return string.format("%.2f%%", cpu)
        end
    };
    [3] = {
      key = "memory";
      header = "RAM Used";
      offset = 250;
      transform = function (value)
        local mem = tonumber(value)
        return string.format("%.2f%%", mem)
      end
    };
    [4] = {
      key = "uptime";
      header = "Uptime";
      offset = 380;
      transform = function (value)
        local uptime = tonumber(value)
        return string.format("%.1f hours", uptime/3600)
      end
    }
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
  for _,c in pairs(data["data"]["result"]) do
    output[#output+1] = {
      value = c["value"][2]
    }
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
    for _, row in ipairs(data) do
        local line = "";
        for _, column in ipairs(columns_def) do
          local value = row[column.key];
          if (column.transform ~= nil) then
            value = column.transform(value)
          end
          line = string.format("%s%s%s", line, format_output(initial_offset, column.offset), value);
        end
        table_string = string.format("%s\n%s", table_string, line)
    end
    return table_string
end

local data = {}
for i = 1,#jobs, 1 do
  local node = nodes[i]
  local job = jobs[i]
  local cpu = extract_data(exec(create_curl_req(cpu_query(node, job))))
  local uptime = extract_data(exec(create_curl_req(uptime_query(node, job))))
  local memory = extract_data(exec(create_curl_req(memory_query(node, job))))

  data[#data+1] = {
    host = job;
    cpu = cpu[1].value;
    uptime = uptime[1].value;
    memory = memory[1].value;
  }
end

print(format_conky_table(x, columns_def, data))
