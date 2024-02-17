local servers = {
    "ansiblels",
    "bashls",
    "dockerls",
    "gopls",
    "html",
    --"yamlls",
    "cssls",
    "tsserver",
    "terraformls",
    "lua_ls",
    "ansiblels",
    "eslint",
    "jdtls",
    "pylsp",
    "serve_d",
    "clangd",
}

local pythonPath = function()
    local cwd = vim.loop.cwd()
    if vim.fn.executable(cwd .. '/.venv/bin/pyls') == 1 then
        return cwd .. '/.venv/bin/python'
    elseif vim.fn.executable(cwd .. '/venv/bin/pyls') == 1 then
        return cwd .. '/venv/bin/python'
    else
        return 'pyls'
    end
end

local settings = {
    ui = {
        border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("lsp.handlers").on_attach,
        capabilities = require("lsp.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    if server == "pylsp" then
        opts.settings = {
            pylsp = {
                plugins = {
                    rope_autoimport = {
                        enable = True
                    },
                    pycodestyle = {
                        ignore = { 'W391'},
                        maxLineLength = 100
                    }
                }
            }
         }
    end

    if server == "sumneko_lua" then
        local n_status_ok, neodev = pcall(require, "neodev")
        if not n_status_ok then
            return
        end

        neodev.setup({})

        local sumneko_opts = require("lsp.settings.sumneko_lua")
        lspconfig.sumneko_lua.setup(sumneko_opts)
        goto continue
    end

    if server == "rust_analyzer" then
        local rust_opts = require("lsp.settings.rust_analyzer")
        -- opts = vim.tbl_deep_extend("force", rust_opts, opts)
        local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
        if not rust_tools_status_ok then
            return
        end

        rust_tools.setup(rust_opts)
        goto continue
    end

    if server == "clangd" then
        local root_files = {
            '.clangd',
            '.clang-tidy',
            '.clang-format',
            'compile_commands.json',
            'compile_flags.txt',
            'configure.ac', -- AutoTools
        }
        lspconfig.clangd.setup({
            cmd = { "/home/cosmin/projects/esp/esp-clang/bin/clangd" },
            filetypes = { "c", "cpp" },
            on_attach = require("lsp.handlers").on_attach,
            capabilities = require("lsp.handlers").capabilities,
        })
        goto continue
    end

    if server == "ansiblels" then
        local util = require 'lspconfig.util'
        lspconfig.ansiblels.setup({
            on_attach = require("lsp.handlers").on_attach,
            capabilities = require("lsp.handlers").capabilities,
            filetypes = { 'yaml.ansible' },
            root_dir = util.root_pattern('ansible.cfg', '.ansible-lint'),
            single_file_support = true,
            cmd = { 'ansible-language-server', '--stdio' },
             settings = {
                ansible = {
                  ansible = {
                    path = "ansible",
                    useFullyQualifiedCollectionNames = true
                  },
                  ansibleLint = {
                    enabled = false,
                    path = "ansible-lint"
                  },
                  executionEnvironment = {
                    enabled = false
                  },
                  python = {
                    interpreterPath = "python"
                  },
                  completion = {
                      provideRedirectModules = true,
                      provideModuleOptionAliases = true
                  }
                },
            },
        })
        goto continue
    end

    lspconfig[server].setup(opts)
    ::continue::
end


require("lspconfig.ui.windows").default_options.border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" }
