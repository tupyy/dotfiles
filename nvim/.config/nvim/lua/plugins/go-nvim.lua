local status_ok, go = pcall(require, "go")

if not status_ok then
    return
end

go.setup{
    lsp_cfg = false
}
