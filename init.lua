-- Entry point: keep this file tiny.
-- Real configuration lives in lua/config (behaviour) and lua/plugins (plugins).

-- Use Neovim's built-in Lua module cache. It is enabled by default on 0.11,
-- but calling it explicitly also covers older versions.
vim.loader.enable()

require("config.options")
require("config.keymaps")
require("config.lazy")
