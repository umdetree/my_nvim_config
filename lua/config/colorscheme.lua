-- Random light colorscheme, as before, but with a safe fallback.
-- github_light was removed: its compiled theme is missing in this setup and
-- makes startup fail.
local M = {}

local themes = {
  "everforest",
  "leaf",
  "dawnfox",
  "dayfox",
  "solarized8",
  "PaperColor",
  "onedark",
  "ayu-light",
}

function M.apply()
  -- Set the background before loading the colorscheme so light variants are
  -- picked correctly.
  vim.o.background = "dark"
  math.randomseed(os.time())

  -- Handy when testing a specific theme: NVIM_COLORSCHEME=leaf nvim
  local scheme = vim.env.NVIM_COLORSCHEME
  if not scheme or scheme == "" then
    scheme = themes[math.random(#themes)]
  end

  if not pcall(vim.cmd.colorscheme, scheme) then
    vim.cmd.colorscheme("habamax")
  end
end

return M
