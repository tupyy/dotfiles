vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 2000 })
    end,
})

-- format file after the save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        vim.cmd('lua vim.lsp.buf.format()')
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "*.ts", "*.tsx", "*.html", "*.css", "*.sass" },
    callback = function()
        vim.cmd.setlocal('shiftwidth=4')
        vim.cmd.setlocal('expandtab')
    end
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile"}, {
    pattern = { 
        "playbook.yml",
        "*/playbooks/*.yml", 
        "*/playbooks/*.yaml", 
        "*/roles/*/tasks/*.yml",
        "*/roles/*/tasks/*.yaml",
        "*/roles/*/handlers/*.yml",
        "*/roles/*/handlers/*.yaml",
    },
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        vim.bo[bufnr].filetype = "yaml.ansible"
    end
})
