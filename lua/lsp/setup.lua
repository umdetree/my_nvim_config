local lsp_installer = require "mason-lspconfig"
local lspconfig = require "lspconfig"

-- 安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- { key: 语言 value: 配置文件 }

local servers = {
  sumneko_lua = require "lsp.lua", -- /lua/lsp/lua.lua
  rust_analyzer = require "lsp.rust",
  clangd = require "lsp.clangd",
  pyright = require "lsp.pyright",
  jdtls = require "lsp.jdtls",
    gopls = require "lsp.gopls",
  html = {}
  -- jsonls = {},
  -- tsserver = {}
}

-- 自动安装 LanguageServers
lsp_installer.setup({
    -- ensure_installed = servers.name
    ensure_installed = {
        "sumneko_lua",
        "rust_analyzer",
        "clangd",
        "pyright",
        "jdtls",
        "html",
    }
})

lsp_installer.setup_handlers{ function(server_name)
  local opts = servers[server_name]
  if opts then
    local on_attach = function(_, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
      -- 绑定快捷键
      require('keybindings').maplsp(buf_set_keymap)
    end
    opts.flags = {
      debounce_text_changes = 150,
    }

    if server_name == "rust_analyzer" then
      -- Initialize the LSP via rust-tools instead
      require("rust-tools").setup {
        -- The "server" property provided in rust-tools setup function are the
        -- settings rust-tools will provide to lspconfig during init.            -- 
        -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
        -- with the user's own settings (opts).
        on_attach = on_attach
      }
    else
        lspconfig[server_name].setup{
            on_attach = on_attach
        }
    end
  end
end}



