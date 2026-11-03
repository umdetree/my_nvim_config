return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = {
      "NvimTreeToggle",
      "NvimTreeOpen",
      "NvimTreeFocus",
      "NvimTreeFindFile",
      "NvimTreeCollapse",
    },
    keys = {
      { "<C-b>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<C-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
      { "<C-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
      { "<C-w>", "<cmd>BufferLinePickClose<CR>", desc = "Pick buffer to close" },
    },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },

  {
    "stevearc/aerial.nvim",
    cmd = "AerialToggle",
    keys = {
      { "<A-f>", "<cmd>AerialToggle<CR>", desc = "Toggle symbols outline" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
}
