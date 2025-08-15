return require('lazy').setup(
{
    {
        'nvim-tree/nvim-tree.lua',
        -- commit="0074120",
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    },
    'akinsho/bufferline.nvim',
    {
        'nvim-treesitter/nvim-treesitter',
        version = nil,
    },
    'windwp/nvim-autopairs',
    -- 'lewis6991/impatient.nvim',
    'lewis6991/gitsigns.nvim',

    'navarasu/onedark.nvim',
    'lifepillar/vim-solarized8',
    'sainnhe/everforest',
    'shaunsingh/nord.nvim',
    'EdenEast/nightfox.nvim',
    'tanvirtin/monokai.nvim',
    'projekt0n/github-nvim-theme',
    'NLKNguyen/papercolor-theme',
    'marko-cerovac/material.nvim',
    'folke/tokyonight.nvim',
    'daschw/leaf.nvim',
    'Shatur/neovim-ayu',
    'Mofiqul/vscode.nvim',
    'sainnhe/sonokai',
    "tiagovla/tokyodark.nvim",

    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    -- 'github/copilot.vim',
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        cmd = "Copilot",
        config = function()
            require("copilot").setup({
                filetypes = {
                    yaml = true,
                    markdown = true,
                    help = true,
                    gitcommit = true,
                    gitrebase = true,
                    hgcommit = true,
                    svn = true,
                    cvs = true,
                    ["."] = true,
                },
                suggestion = {
                    auto_trigger = true,
                    keymap = {
                        accept = "<Tab>",
                    }
                }
            })
        end
    },
    -- vsnip
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'rafamadriz/friendly-snippets',
    -- lspkind
    'onsails/lspkind-nvim',

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { {'nvim-lua/plenary.nvim'} },
    },
    'stevearc/aerial.nvim',
    'MattesGroeger/vim-bookmarks',
    'tom-anders/telescope-vim-bookmarks.nvim',

    {
        'numToStr/Comment.nvim',
    },
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({})
        end
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npx --yes yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
            -- vim.g.mkdp_auto_close = 0
        end,
        ft = { "markdown" },
    },
    'simrat39/rust-tools.nvim',
    'rust-lang/rust.vim',
},
{
    defaults = {
        version = nil,
    },
}
)
