return {
  {
    "neovim/nvim-lspconfig",
    -- Load before filetype detection so LSP can attach to the first buffer.
    -- VeryLazy also loads it when Neovim is started without a file, making
    -- the built-in :lsp commands usable immediately.
    event = { "BufReadPost", "BufNewFile", "VeryLazy" },
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      require("config.lsp").setup()
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonUpdate",
      "MasonLog",
    },
    config = function()
      require("mason").setup()
      -- Keep the "install missing servers when Mason is used" behaviour,
      -- without paying for the registry refresh on every startup.
      require("lazy").load({ plugins = { "mason-lspconfig.nvim" } })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    cmd = { "MasonInstall", "MasonUpdate" },
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = require("config.lsp").ensure_installed,
        -- Servers are enabled explicitly in config/lsp.lua.
        automatic_enable = false,
      })
    end,
  },
}
