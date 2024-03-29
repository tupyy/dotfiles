local awful = require("awful")

local function execute_once(command)
  local command_program_name = command
  local first_space_position = command:find(" ")
  if first_space_position ~= nil then
    command_program_name = command:sub(0, first_space_position - 1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. command_program_name .. " > /dev/null || (" .. command .. ")")
end

local function execute_commands(commands)
  for _,command in ipairs(commands) do
    execute_once(command)
  end
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

local executer = {}

executer.execute_commands = execute_commands
executer.exec = exec

return executer
