local random_light_color = {
    "everforest",
    "leaf",
    "dawnfox",
    "dayfox",
    "github_light",
    "solarized8",
    "PaperColor",
    "onedark",
}
-- 样式
vim.o.termguicolors = true
vim.opt.termguicolors = true
math.randomseed(os.time())
local my_color = random_light_color[math.random(8)]
vim.cmd('colorscheme ' .. my_color)
vim.o.background = "light"