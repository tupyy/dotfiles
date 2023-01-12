#!/usr/bin/lua

require 'luarocks.loader'
local lunajson = require 'lunajson'
local docker = "docker ps -a --format=\"{{json .}}\""
local podman = "podman ps -a --format=json"
local x = 550;
local columns_offset = {
    id = {
        key = "id";
        header = "ID";
        offset = 0
    };
    image = {
        key = "image";
        header = "Image";
        offset = 180
    };
    name = {
        key = "name";
        header = "Name";
        offset = 640;
    };
    ports = {
        key = "ports";
        header = "Ports";
        offset = 880;
    };
    state = {
        key = "state";
        header = "State";
        offset = 1200;
    };
}

local function exec(cmd)
    local result = io.popen(cmd)
    if (result == nil) then
        return "", error("invalid result")
    end
    local output = result:read("*a")
    result:close()
    return output, nil
end

local function parse_podman(ps_output)
    local output = {}
    for _, c in pairs(ps_output) do
        output[#output + 1] = {
            name = c["Names"][#c["Names"]];
            ports = c["Ports"];
            state = c["State"];
            image = c["Image"];
            id = c["Id"];
        }
    end
    return output
end

-- local function parse_ports(local ports)
--     for _, c in pairs(ports) do
--     end
-- end
local function parse(output, runtime)
    local json = lunajson.decode(output)
    return parse_podman(json)
end

local function format_conky_table(x, columns_offset, results)
    local format_output = function(x, offset)
        return string.format("${goto %s}", x + offset)
    end
    local header = ""
    for _, c in pairs(columns_offset) do
        header = string.format("%s%s%s", header, format_output(x, c.offset), c.header)
    end
    local table_string = string.format("%s", header)
    for _, r in ipairs(results) do
        local line = "${color white}"
        if r.state == "running" then
            line = "${color green}"
        end
        for k, v in pairs(r) do
            local column = columns_offset[k]
            if (column ~= nil) then
                if column.key == "id" or column.key == "name" then
                    v = string.sub(v, 0, 15)
                elseif column.key == "ports" then
                  local ports = "";
                  for i,port in ipairs(v) do
                    if i == 1 then
                      ports = string.format("%s:%s", port.container_port, port.host_port)
                    else
                      ports = ports .. "," .. string.format("%s:%s", port.container_port, port.host_port)
                    end
                  end
                  v = ports;
                end
                line = string.format("%s%s%s", line, format_output(x, column.offset), v)
            end
        end
        table_string = string.format("%s\n%s${color white}", table_string, line)
    end
    return table_string
end

runtime = "podman" or arg[1]
if (runtime == "podman") then
    output = exec(podman)
else
    output = exec(docker)
end
print(format_conky_table(x, columns_offset, parse(output, runtime)))
