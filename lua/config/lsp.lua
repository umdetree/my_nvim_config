-- LSP setup using Neovim 0.12's vim.lsp.config / vim.lsp.enable API.
local M = {}

M.ensure_installed = {
  "rust_analyzer",
  "clangd",
  "pyright",
  "jdtls",
  "gopls",
  "html",
  "ts_ls",
  "lua_ls",
}

-- Servers started by vim.lsp.enable.
M.servers = {
  "lua_ls",
  "rust_analyzer",
  "clangd",
  "pyright",
  "jdtls",
  "gopls",
  "html",
  "ts_ls",
}

local border = "rounded"

--- Buffer-local keymaps installed for every LSP client.
---@param client vim.lsp.Client
---@param bufnr integer
function M.on_attach(client, bufnr)
  local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, {
      buf = bufnr,
      silent = true,
      desc = desc,
    })
  end

  map("n", "<A-r>", vim.lsp.buf.rename, "Rename symbol")
  map("n", "<Space>ca", vim.lsp.buf.code_action, "Code action")
  map("n", "<C-k>", function()
    vim.lsp.buf.hover({ border = border })
  end, "Hover documentation")
  map("n", "<A-d>", vim.lsp.buf.declaration, "Go to declaration")
  map("n", "<A-i>", vim.lsp.buf.implementation, "Go to implementation")
  map("n", "<A-o>", vim.lsp.buf.references, "Find references")
  map("n", "go", vim.diagnostic.open_float, "Show diagnostics")
  map("n", "<A-p>", function()
    vim.diagnostic.jump({ count = -1 })
  end, "Previous diagnostic")
  map("n", "<A-s>", function()
    vim.lsp.buf.signature_help({ border = border })
  end, "Signature help")
  map("i", "<A-s>", function()
    vim.lsp.buf.signature_help({ border = border })
  end, "Signature help")

  if client.name == "rust_analyzer" then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
end

function M.setup()
  vim.lsp.config("*", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })

  -- Use LspAttach instead of a global on_attach: server-specific configs (for
  -- example rust_analyzer) may define their own on_attach, which would
  -- otherwise override the global one.
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("config.lsp", { clear = true }),
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client then
        M.on_attach(client, args.buf)
      end
    end,
  })

  -- Per-server settings live in lua/lsp/.
  vim.lsp.config("lua_ls", require("lsp.lua"))
  vim.lsp.enable(M.servers)

  vim.diagnostic.config({
    virtual_text = true,
    float = { border = border },
  })
end

return M
