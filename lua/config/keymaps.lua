-- Global keymaps. Plugin-specific maps live next to their plugin specs.
local map = vim.keymap.set

-- Visual mode: keep the selection after indenting.
map("v", "<", "<gv", { desc = "Outdent" })
map("v", ">", ">gv", { desc = "Indent" })

-- Commenting is built into Neovim 0.12 (gc/gcc), no plugin needed.
map("n", "<A-c>", "gcc", { remap = true, desc = "Toggle comment line" })
map("v", "<A-c>", "gc", { remap = true, desc = "Toggle comment" })

-- Use "very magic" regex for search.
map("n", "/", "/\\v", { desc = "Search (very magic)" })
map("v", "/", "/\\v", { desc = "Search (very magic)" })

-- Move between windows with Alt + hjkl.
map("n", "<A-h>", "<C-w>h", { silent = true, desc = "Window left" })
map("n", "<A-j>", "<C-w>j", { silent = true, desc = "Window down" })
map("n", "<A-k>", "<C-w>k", { silent = true, desc = "Window up" })
map("n", "<A-l>", "<C-w>l", { silent = true, desc = "Window right" })

-- Resize windows.
map("n", "<A-+>", "<C-w>+", { silent = true, desc = "Increase window height" })
map("n", "<A-->", "<C-w>-", { silent = true, desc = "Decrease window height" })
map("n", "<A-=>", "<C-w>=", { silent = true, desc = "Equalize windows" })
map("n", "<A-.>", "<C-w>>", { silent = true, desc = "Increase window width" })
map("n", "<A-,>", "<C-w><", { silent = true, desc = "Decrease window width" })

-- LSP navigation is global; the buffer-local LSP maps are set on attach.
map("n", "<A-g>", vim.lsp.buf.definition, { silent = true, desc = "Go to definition" })
map("n", "<A-n>", function()
  vim.diagnostic.jump({ count = 1 })
end, { silent = true, desc = "Next diagnostic" })
