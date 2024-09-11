-- Example config in lua
-- vim.g.nord_contrast = true
-- vim.g.nord_borders = false
-- vim.g.nord_disable_background = false
-- vim.g.nord_italic = false
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('plugins')
-- require('impatient')
require('basic')
require('color')
require('keybindings')
require('gitsigns').setup{}
require('nvim-tree').setup{}

require('plugin-config/bufferline')
require('plugin-config/nvim-treesitter')
require('mason').setup()
require('aerial').setup()

require('lsp/setup')
require('lsp/nvim-cmp')

require('nvim-autopairs').setup{}
require('Comment').setup{}
require('telescope').load_extension('vim_bookmarks')

require("leaf").setup({
    contrast = "high",
})
