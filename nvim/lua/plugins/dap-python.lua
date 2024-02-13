local dap = require('dap')
local pythonPath = function()
    local cwd = vim.loop.cwd()
    if vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
    elseif vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
    else
        return '/usr/bin/python'
    end
end
local findAnsiBall = function(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls -a "'..directory..'"')
    for filename in pfile:lines() do
        start, _ = string.find(filename, "AnsiballZ") 
        if start == 1 then
            return vim.loop.cwd() .. "/" .. filename
        end
    end
    pfile:close()
    return ""
end
local set_python_dap = function()
    require('dap-python').setup() -- earlier so setup the various defaults ready to be replaced
    dap.configurations.python = {
        {
            type = 'python';
            request = 'launch';
            name = "Launch file";
            program = "${file}";
            pythonPath = pythonPath()
        },
        {
            type = 'python';
            request = 'attach';
            name = 'Attach remote';
            connect = function()
                return {
                    host = '127.0.0.1',
                    port = 5678
                }
            end;
        },
        {
            type = 'python';
            request = 'launch';
            name = 'Launch file with arguments';
            program = '${file}';
            args = function()
                local args_string = vim.fn.input('Arguments: ')
                return vim.split(args_string, " +")
            end;
            console = "integratedTerminal",
            pythonPath = pythonPath()
        },
        {
            type = 'python';
            request = 'launch';
            name = 'Launch AnsibleBall';
            program = findAnsiBall(vim.loop.cwd());
            args = function()
                return { "execute" }
            end;
            console = "integratedTerminal",
            pythonPath = pythonPath()
        }
    }
    dap.adapters.python = {
        type = 'executable',
        command = pythonPath(),
        args = {'-m', 'debugpy.adapter'}
    }
end
set_python_dap()
vim.api.nvim_create_autocmd({"DirChanged"}, {
    callback = function() set_python_dap() end,
})
