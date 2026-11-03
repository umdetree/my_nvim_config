return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },

  {
    "MattesGroeger/vim-bookmarks",
    -- Tiny Vimscript plugin; keep its default mappings and telescope
    -- extension functions available from the first moment.
    lazy = false,
    keys = {
      { "<A-m>", "<cmd>BookmarkToggle<CR>", desc = "Toggle bookmark" },
    },
  },
}
