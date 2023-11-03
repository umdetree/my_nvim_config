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
    "ayu-dark",
    "ayu-mirage",
    "vscode",
    "sonokai"
}
-- 样式
vim.o.termguicolors = true
vim.opt.termguicolors = true
math.randomseed(os.time())
local my_color = random_dark_color[math.random(18)]
vim.cmd('colorscheme ' .. my_color)
vim.o.background = "dark"
