#!/usr/bin/lua

require 'luarocks.loader'
local lunajson = require 'lunajson'

local hosts = {
    [1] = {
        node = "fedorasrv:9100",
        name = "fedorasrv",
    },
    [2] = {
        node = "rhel1:9100",
        name = "rhel1",
    },
    [3] = {
        node = "rhel2:9100",
        name = "rhel2",
    },
}

local function uptime_query(node)
    return string.format(
        "node_time_seconds{instance=\"%s\"} - node_boot_time_seconds{instance=\"%s\"}", node, node);
end

local function cpu_query(node)
    return string.format(
        "(sum by(instance) (irate(node_cpu_seconds_total{instance=\"%s\", mode!=\"idle\"}[10m])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"%s\"}[10m])))) * 100",
        node, node);
end

local function memory_query(node)
    local totalMem = string.format("node_memory_MemTotal_bytes{instance=\"%s\"}", node)
    local freeMem = string.format("node_memory_MemFree_bytes{instance=\"%s\"}", node);
    local cachedMem = string.format("node_memory_Cached_bytes{instance=\"%s\"}", node);
    return string.format("((%s - %s -%s) / (%s)) * 100", totalMem, freeMem, cachedMem, totalMem);
end

local function rootfs_query(node)
    local avail_bytes = string.format(
        "node_filesystem_avail_bytes{instance=\"%s\",mountpoint=\"/\",fstype!=\"rootfs\"}", node)
    local total = string.format(
        "node_filesystem_size_bytes{instance=\"%s\",mountpoint=\"/\",fstype!=\"rootfs\"}", node);
    return string.format("100 - ((%s * 100) / %s)", avail_bytes, total);
end

local function datafs_query(node)
    local avail_bytes = string.format(
        "node_filesystem_avail_bytes{instance=\"%s\",mountpoint=\"/data\",fstype!=\"rootfs\"}", node)
    local total = string.format(
        "node_filesystem_size_bytes{instance=\"%s\",mountpoint=\"/data\",fstype!=\"rootfs\"}", node);
    return string.format("100 - ((%s * 100) / %s)", avail_bytes, total);
end

local function temp_query(node)
    return "sum (node_thermal_zone_temp{type=\"x86_pkg_temp\",instance=\"" .. node .. "\"})"
end

local function create_curl_req(query)
    return "curl -s --data-urlencode 'query=" .. query .. "' https://prometheus.tls.tupangiu.ro/api/v1/query"
end

local x = 550;
local columns_def = {
    [1] = {
        key = "host",
        header = "Host",
        offset = 0,
        transform = function(value)
            return string.gsub(value, ":(%d+)", "")
        end
    },
    [2] = {
        key = "cpu",
        header = "CPU",
        offset = 150,
        transform = function(value)
            local cpu = tonumber(value);
            return string.format("%.2f%%", cpu)
        end
    },
    [3] = {
        key = "memory",
        header = "RAM Used",
        offset = 250,
        transform = function(value)
            local mem = tonumber(value)
            return string.format("%.2f%%", mem)
        end
    },
    [4] = {
        key = "rootfs",
        header = "RootFS Used",
        offset = 380,
        transform = function(value)
            local data = tonumber(value)
            return string.format("%.2f%%", data);
        end
    },
    [5] = {
        key = "datafs",
        header = "DataFS Used",
        offset = 550,
        transform = function(value)
            local data = tonumber(value)
            return string.format("%.2f%%", data);
        end
    },
    [6] = {
        key = "temp",
        header = "Temp",
        offset = 710,
    },
    [7] = {
        key = "uptime",
        header = "Uptime",
        offset = 800,
        transform = function(value)
            local uptime = tonumber(value)
            return string.format("%.1f hours", uptime / 3600)
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
    for _, c in pairs(data["data"]["result"]) do
        table.insert(output, { value = c["value"][2] })
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

local data = {}
local getData = function(data)
    if (#data > 0) then
        return data[1].value
    else
        return nil
    end
end

for _, v in pairs(hosts) do
    local node = v.node
    local name = v.name
    local cpu = extract_data(exec(create_curl_req(cpu_query(node))))
    local uptime = extract_data(exec(create_curl_req(uptime_query(node))))
    local memory = extract_data(exec(create_curl_req(memory_query(node))))
    local rootfs = extract_data(exec(create_curl_req(rootfs_query(node))))
    local datafs = extract_data(exec(create_curl_req(datafs_query(node))))
    local temp = extract_data(exec(create_curl_req(temp_query(node))))

    data[#data + 1] = {
        host = name,
        cpu = getData(cpu),
        uptime = getData(uptime),
        memory = getData(memory),
        rootfs = getData(rootfs),
        datafs = getData(datafs),
        temp = getData(temp),
    }
end

print(format_conky_table(x, columns_def, data))
