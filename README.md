# my_nvim_config

A small, fast **Neovim 0.12** configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim).

[参考](https://github.com/nshen/learn-neovim-lua)

## 依赖

- Neovim >= 0.12
- `git`
- `tree-sitter` CLI >= 0.26.1（nvim-treesitter main 分支需要）
- 一个 C 编译器（Windows 上可用 MinGW/MSYS2 或 MSVC）
- Mason 安装的语言服务器

`tree-sitter` CLI 可以通过 winget 安装：

```powershell
winget install tree-sitter.tree-sitter-cli
```

装完后请新开一个终端，让 `PATH` 生效。

## 目录结构

```text
init.lua                 -- 入口：只加载三个配置模块
lua/
  config/
    options.lua          -- 编辑器选项
    keymaps.lua          -- 全局快捷键（含内置 gc/gcc 注释）
    lazy.lua             -- lazy.nvim 引导与全局设置
    colorscheme.lua      -- 随机浅色主题（支持 NVIM_COLORSCHEME 覆盖）
    lsp.lua              -- vim.lsp.config / vim.lsp.enable + LspAttach
  plugins/
    colorscheme.lua      -- 配色插件
    ui.lua               -- nvim-tree / bufferline / aerial
    telescope.lua        -- 模糊查找
    git.lua              -- gitsigns / bookmarks
    editor.lua           -- surround / autopairs
    cmp.lua              -- nvim-cmp / Copilot
    lsp.lua              -- LSP / Mason
    treesitter.lua       -- nvim-treesitter main
    markdown.lua         -- Markdown 预览
    rust.lua             -- rust.vim（Rust LSP/内联提示走内置客户端）
  lsp/
    lua.lua              -- lua_ls 的专用设置
ftplugin/                -- 按文件类型的局部设置
```

## 加载策略

- 大多数插件按事件/命令/文件类型懒加载：
  - `BufReadPost`：gitsigns、nvim-lspconfig
  - `InsertEnter`：nvim-cmp、autopairs、Copilot
  - `VeryLazy`：bufferline、surround、bookmarks
  - `cmd`/`keys`：nvim-tree、telescope、aerial、Mason
- `nvim-treesitter` main 分支不支持懒加载，因此保持 eager；解析器在 `stdpath('data')/site`，启动时只安装缺失项。
- `nvim .` 或 `nvim <目录>` 会在 `VimEnter` 时懒加载 nvim-tree，并把目录 buffer 换成空白编辑窗口 + 侧栏。
- `lazy-lock.json` 已纳入版本控制，插件版本可复现。
- Mason 不再在启动时刷新 registry；执行 `:Mason` / `:MasonInstall` 时才会检查缺失的 LSP。
- Rust 不再使用归档的 `rust-tools.nvim`，改为内置 `rust_analyzer` + `vim.lsp.inlay_hint`。
- 注释使用 Neovim 0.12 自带的 `gc` / `gcc`，不再依赖 `Comment.nvim`。

## 已知遗留

- `telescope.nvim` 仍依赖已归档的 `plenary.nvim`。目前功能正常；若要彻底移除，需要改用其他 picker（例如 `fzf-lua` 或 `snacks.picker`），本轮保持不变以免改变现有操作习惯。
- `bufferline.nvim`、`rust.vim` 更新频率较低，但仍可正常工作，因此暂时保留。

## 常用命令

```vim
:Lazy          " 插件管理
:Mason         " 语言服务器/工具安装
:checkhealth vim.lsp  " LSP 状态（Neovim 0.12 内置）
:lsp restart   " 重启 LSP（Neovim 0.12 内置）
:TSInstall     " 安装 treesitter 解析器
:TSUpdate      " 更新 treesitter 解析器
:checkhealth   " 健康检查
```

## 启动耗时

```powershell
nvim --headless --startuptime "$env:TEMP\nvim-startup.log" +q
Get-Content "$env:TEMP\nvim-startup.log" | Select-Object -Last 5
```

如需指定主题（方便对比/截图）：

```powershell
$env:NVIM_COLORSCHEME = "leaf"; nvim; Remove-Item Env:NVIM_COLORSCHEME
```
