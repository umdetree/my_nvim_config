-- lua_ls settings, based on the recommendation in nvim-lspconfig.
-- Only the Neovim runtime is added as a library: scanning the whole
-- runtimepath makes the server noticeably slower.
return {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = {
          "lua/?.lua",
          "lua/?/init.lua",
        },
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
