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
    init = function()
      -- `nvim .` (or `nvim <directory>`) starts with a directory buffer.
      -- Load the tree on demand and replace that buffer with a clean one so
      -- nvim-tree opens as a sidebar next to a normal editor window.
      vim.api.nvim_create_autocmd("VimEnter", {
        group = vim.api.nvim_create_augroup("config.nvim_tree_startup", { clear = true }),
        callback = function()
          if vim.fn.argc() ~= 1 then
            return
          end

          local arg = vim.fn.argv(0)
          if vim.fn.isdirectory(arg) ~= 1 then
            return
          end

          local dir = vim.fn.fnamemodify(arg, ":p")
          require("lazy").load({ plugins = { "nvim-tree.lua" } })

          vim.fn.chdir(dir)
          local old_buf = vim.api.nvim_get_current_buf()
          vim.cmd("enew")
          if vim.api.nvim_buf_is_valid(old_buf) then
            vim.api.nvim_buf_delete(old_buf, { force = true })
          end

          require("nvim-tree.api").tree.open({ path = dir })
        end,
      })
    end,
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
