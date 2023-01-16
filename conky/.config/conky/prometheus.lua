#!/usr/bin/lua

require 'luarocks.loader'
local lunajson = require 'lunajson'

local podman_query="sum by (name,ports) (podman_container_info*on(id) group_right(name,ports) podman_container_state)";
local curl="curl -s --data-urlencode 'query=" .. podman_query .. "' http://localhost:7090/api/v1/query";

local x = 550;
local columns_def = {
    name = {
        key = "name";
        header = "Name";
        offset = 0;
    };
    ports = {
      key = "ports";
      header= "Ports";
      offset = 300;
      transform = function (value)
        value=value:gsub("0%.0%.0%.0:", "")
        value=value:gsub("/tcp", "")
        return value
      end
    };
    state = {
        key = "state";
        header = "State";
        offset = 650;
    };
}

local state_def = {
  ["-1"] = {
    value = "unknown";
    color = "${color white}";
  };
  ["0"] = {
    value = "created";
    color = "${color white}";
  };
  ["1"] = {
    value = "initialized";
    color = "${color white}";
  };
  ["2"] = {
    value = "running";
    color = "${color green}";
  };
  ["3"] = {
    value = "stopped";
    color = "${color red}"
  };
  ["4"] = {
    value = "paused";
    color = "${color yellow}";
  };
  ["5"] = {
    value = "exited";
    color = "${color red}"
  };
  ["6"] = {
    value = "removing";
    color = "${color yellow}"
  };
  ["7"] = {
    value = "stopping";
    color = "${color red}"
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

local function parse(output)
  local data = lunajson.decode(output)
  output = {}
  for _,c in pairs(data["data"]["result"]) do
    output[#output+1] = {
      name = c["metric"]["name"];
      ports = c["metric"]["ports"];
      state = state_def[c["value"][2]]
    }
  end
  return output
end

local function format_conky_table(initial_offset, columns, results)
    local format_output = function(x, offset)
        return string.format("${goto %s}", x + offset)
    end

    local header = ""
    for _, c in pairs(columns) do
        header = string.format("%s%s%s", header, format_output(initial_offset, c.offset), c.header)
    end

    local table_string = string.format("%s", header)
    for _, r in ipairs(results) do
        local line = r.state.color;
        line = string.format("%s%s%s", line, format_output(initial_offset, columns_def.name.offset), string.sub(r.name,0,20));
        line = string.format("%s%s%s", line, format_output(initial_offset, columns_def.ports.offset), columns_def.ports.transform(r.ports));
        line = string.format("%s%s%s", line, format_output(initial_offset, columns_def.state.offset), r.state.value);
        table_string = string.format("%s\n%s${color white}", table_string, line)
    end
    return table_string
end

local d = exec(curl);
print(format_conky_table(x,columns_def, parse(d)))
