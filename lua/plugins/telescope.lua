return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- The bookmark extension calls vim-bookmarks' bm# autoload functions.
      "MattesGroeger/vim-bookmarks",
      "tom-anders/telescope-vim-bookmarks.nvim",
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({})
      telescope.load_extension("vim_bookmarks")
    end,
  },
}
