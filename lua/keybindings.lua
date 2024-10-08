-- 本地变量
local map = vim.api.nvim_set_keymap
local opt = {
  noremap = true,
  silent = true
}

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- Nerdtree toggle
-- vim.cmd('nnoremap <C-b> :NERDTreeToggle<CR>')
vim.cmd('nnoremap <C-b> :NvimTreeToggle<CR>')

-- bufferline 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)

-- magic search
map("n", "/", "/\\v", { noremap = true , silent = false})
map("v", "/", "/\\v", { noremap = true , silent = false})

------------------------------------------------------------------
-- 关闭当前

-- alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
map("n", "<A-+>", "<C-w>+", opt)
map("n", "<A-->", "<C-w>-", opt)
map("n", "<A-=>", "<C-w>=", opt)
map("n", "<A-.>", "<C-w>>", opt)
map("n", "<A-,>", "<C-w><", opt)

map("n", "<C-w>", ":BufferLinePickClose<CR>", opt)
vim.cmd('nnoremap <A-m> :BookmarkToggle<CR>')

--------------------------------------------------------------------
-- 插件快捷键
-- comment
map("n", "<A-c>", "<cmd>normal gcc<CR>", opt)
map("v", "<A-c>", "<cmd>normal gcc<CR>", opt)
local pluginKeys = {}

-- Telescope
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", opt)
map("n", "<A-f>", "<cmd>AerialToggle<CR>", opt)

-- lsp 回调函数快捷键设置
map("n", "<A-g>", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
map('n', '<A-n>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
pluginKeys.maplsp = function(mapbuf)
  -- rename
  mapbuf('n', '<A-r>', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
  -- code action
  mapbuf('n', '<Space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)

  -- go xx
  -- mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  mapbuf('n', '<C-k>', '<cmd>lua vim.lsp.buf.hover({popup_opts={border=round}})<CR>', opt)
  mapbuf('n', '<A-d>', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
  mapbuf('n', '<A-i>', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
  mapbuf('n', '<A-o>', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
  -- diagnostic
  mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
  mapbuf('n', '<A-p>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
  -- mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  mapbuf('n', '<A-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
  mapbuf('i', '<A-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
  -- leader + =
  -- mapbuf('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
  return {
    -- 上一个
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    -- 下一个
    ['<C-j>'] = cmp.mapping.select_next_item(),
    -- 出现补全
    ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- 取消
    ['<A-,>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 确认
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({
      select = true ,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  }
end

return pluginKeys
