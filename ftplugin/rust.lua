local on_attach = function(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    -- 绑定快捷键
    require('keybindings').maplsp(buf_set_keymap)
end

-- Initialize the LSP via rust-tools instead
require("rust-tools").setup( {
-- The "server" property provided in rust-tools setup function are the
-- settings rust-tools will provide to lspconfig during init.            -- 
-- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
-- with the user's own settings (opts).
server = {
    on_attach = on_attach
}
})
require("rust-tools").inlay_hints.set()
require("rust-tools").inlay_hints.enable()
