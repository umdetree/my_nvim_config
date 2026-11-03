-- Colorschemes. They stay eager (only their runtime files are added), so
-- :colorscheme keeps working for every installed theme. Only the selected
-- theme is actually loaded by config/colorscheme.lua.
return {
  "navarasu/onedark.nvim",
  "lifepillar/vim-solarized8",
  "sainnhe/everforest",
  "shaunsingh/nord.nvim",
  "EdenEast/nightfox.nvim",
  "tanvirtin/monokai.nvim",
  "projekt0n/github-nvim-theme",
  "NLKNguyen/papercolor-theme",
  "marko-cerovac/material.nvim",
  "folke/tokyonight.nvim",
  {
    "daschw/leaf.nvim",
    config = function()
      require("leaf").setup({ contrast = "high" })
    end,
  },
  "Shatur/neovim-ayu",
  "Mofiqul/vscode.nvim",
  "sainnhe/sonokai",
  "tiagovla/tokyodark.nvim",
}
