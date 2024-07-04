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
-- 样式
vim.o.termguicolors = true
vim.opt.termguicolors = true
math.randomseed(os.time())
-- local my_color = random_dark_color[math.random(#random_dark_color)]
-- vim.cmd('colorscheme ' .. local_my_color)
vim.cmd('colorscheme nord')
vim.o.background = "dark"
vim.cmd('hi Normal cterm=none guibg=none')
vim.cmd('hi NonText cterm=none guibg=none')
