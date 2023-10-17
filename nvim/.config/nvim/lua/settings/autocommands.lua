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
