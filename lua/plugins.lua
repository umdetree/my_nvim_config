return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }
    use 'akinsho/bufferline.nvim'
    use { 'nvim-treesitter/nvim-treesitter'}
    use 'windwp/nvim-autopairs'
    use 'lewis6991/impatient.nvim'
    use 'lewis6991/gitsigns.nvim'

    use 'navarasu/onedark.nvim'
    use 'lifepillar/vim-solarized8'
    use 'sainnhe/everforest'
    use 'shaunsingh/nord.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'tanvirtin/monokai.nvim'
    use 'projekt0n/github-nvim-theme'
    use 'NLKNguyen/papercolor-theme'
    use 'marko-cerovac/material.nvim'
    use 'folke/tokyonight.nvim'
    use 'daschw/leaf.nvim'
    use 'Shatur/neovim-ayu'

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
        requires = { {'nvim-lua/plenary.nvim'} },
        -- branch = "0.1.x",
    }
    use 'MattesGroeger/vim-bookmarks'
    use 'tom-anders/telescope-vim-bookmarks.nvim'

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use({
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({})
        end
    })

    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup
        = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = {
            "markdown" }, })
    vim.g.mkdp_auto_close = 0
    use 'simrat39/rust-tools.nvim'
    use 'rust-lang/rust.vim'

end)
