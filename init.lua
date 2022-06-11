-- Example config in lua
vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_italic = false

require('basic')
require('plugins')
require('keybindings')

require('plugin-config/bufferline')
require('plugin-config/nvim-treesitter')

require('lsp/setup')
require('lsp/nvim-cmp')

require('nvim-autopairs').setup{}
require('Comment').setup{}
require('telescope').load_extension('vim_bookmarks')

