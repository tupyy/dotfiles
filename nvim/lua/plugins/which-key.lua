local status_ok, keys = pcall(require, "which-key")
if not status_ok then
    return
end

keys.setup{}
