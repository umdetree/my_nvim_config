local random_dark_color = {
    "material",
    "everforest",
    "leaf",
    "nightfox",
    "nord",
    "nordfox",
    "terafox",
    "duskfox",
    "carbonfox",
    "tokyonight",
    "monokai_pro",
    "habamax",
    "github_dark",
    "onedark",
    "ayu-mirage",
    "vscode",
    "sonokai",
    "tokyodark"
}

local random_tranparent_color = {
    "leaf",
    "nord",
    "ayu-mirage"
}

-- 样式
vim.o.termguicolors = true
vim.opt.termguicolors = true
math.randomseed(os.time())
local my_color = random_tranparent_color[math.random(#random_tranparent_color)]
vim.cmd('colorscheme ' .. my_color)
-- vim.cmd('colorscheme leaf')
vim.o.background = "dark"
vim.cmd('hi Normal cterm=none guibg=none')
vim.cmd('hi NonText cterm=none guibg=none')
vim.cmd('hi NormalFloat cterm=none guibg=none')
