local status_ok, arduino = pcall(require, "arduino")

if not status_ok then
    return
end

arduino.setup({
    default_fqbn = "esp32:esp32:esp32",
    --Path to clangd (all paths must be full)
    clangd = require 'mason-core.path'.bin_prefix 'clangd',
    --Path to arduino-cli
    arduino = "/home/cosmin/.local/bin/arduino-cli",
    --Data directory of arduino-cli
    arduino_config_dir = "/home/cosmin/.arduino15/",
})

if (require('arduino').configured) then
    print("arduino not configured")
end
