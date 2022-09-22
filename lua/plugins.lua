return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'preservim/nerdtree'
    use 'ryanoasis/vim-devicons'
    use 'akinsho/bufferline.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'windwp/nvim-autopairs'

    use 'navarasu/onedark.nvim'
    use 'lifepillar/vim-solarized8'
    use 'LunarVim/darkplus.nvim'
    use 'sainnhe/everforest'
    use 'doums/darcula'
    use 'shaunsingh/nord.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'tanvirtin/monokai.nvim'
    use 'projekt0n/github-nvim-theme'
    use 'NLKNguyen/papercolor-theme'
    use 'marko-cerovac/material.nvim'
    use 'folke/tokyonight.nvim'

    use {'neovim/nvim-lspconfig'}
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
    use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
    use 'hrsh7th/cmp-path'     -- { name = 'path' }
    use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
    use 'hrsh7th/nvim-cmp'
    -- vsnip
    use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'
    -- lspkind
    use 'onsails/lspkind-nvim'

    use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'MattesGroeger/vim-bookmarks'
    use 'tom-anders/telescope-vim-bookmarks.nvim'

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'tpope/vim-surround'

    use 'simrat39/rust-tools.nvim'
    use 'rust-lang/rust.vim'

end)
