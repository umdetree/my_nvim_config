-- Editor options.
local opt = vim.opt

-- Mason installs its tools in this directory. Mason itself is lazy-loaded, so
-- add the bin directory to PATH here to keep LSP servers discoverable.
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
if vim.fn.isdirectory(mason_bin) == 1 and not vim.env.PATH:find(mason_bin, 1, true) then
  local sep = vim.fn.has("win32") == 1 and ";" or ":"
  vim.env.PATH = mason_bin .. sep .. vim.env.PATH
end

opt.fileencoding = "UTF-8"

-- Keep some context around the cursor.
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Line numbers and the sign column.
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.colorcolumn = "80"

-- System clipboard.
opt.clipboard = "unnamedplus"

-- Indentation: 4 spaces.
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Search.
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.showmode = true
opt.autoread = true
opt.wrap = true
opt.whichwrap = "b,s,<,>,[,],h,l"
opt.hidden = true
opt.mouse = "a"

-- No backup/swap litter.
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Snappier diagnostics and mappings.
opt.updatetime = 300
opt.timeoutlen = 100

opt.splitbelow = true
opt.splitright = true

-- Completion is configured by nvim-cmp.
opt.completeopt = "menu,menuone,noselect"
opt.shortmess:append("c")
opt.pumheight = 10

-- Always show the tabline (bufferline).
opt.showtabline = 2

-- True color for all colorschemes.
opt.termguicolors = true
