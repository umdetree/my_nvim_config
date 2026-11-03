-- lazy.nvim bootstrap and global plugin options.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
    }, true, {})
    error("Could not bootstrap lazy.nvim")
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "leaf", "habamax" } },
  -- Do not poll for updates or reload config files in the background.
  checker = { enabled = false },
  change_detection = { notify = false },
  -- No plugin in this config needs luarocks.
  rocks = { enabled = false },
  ui = { border = "rounded" },
})

-- Pick a random light theme once lazy.nvim has put the theme plugins on rtp.
require("config.colorscheme").apply()
