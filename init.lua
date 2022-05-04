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
