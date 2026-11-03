-- nvim-treesitter main branch (the rewritten version for Neovim 0.12+).
-- This plugin does not support lazy-loading, so it stays eager.
local parsers = {
  "html",
  "css",
  "vim",
  "lua",
  "javascript",
  "typescript",
  "c",
  "rust",
  "toml",
  "cpp",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = function()
      require("nvim-treesitter").update():wait(600000)
    end,
    config = function()
      -- Install missing parsers asynchronously. This avoids loading the
      -- installer (and doing any work) when everything is already present.
      local installed = require("nvim-treesitter").get_installed("parsers")
      local missing = vim.tbl_filter(function(lang)
        return not vim.tbl_contains(installed, lang)
      end, parsers)
      if #missing > 0 and vim.fn.executable("tree-sitter") == 1 then
        require("nvim-treesitter").install(missing)
      end

      -- On the main branch, highlighting/folding/indentation are enabled by
      -- the user instead of nvim-treesitter.configs.
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("config.treesitter", { clear = true }),
        callback = function(args)
          local bufnr = args.buf

          -- Skip special buffers and parsers that are not installed.
          if vim.bo[bufnr].buftype ~= "" then
            return
          end

          if not vim.treesitter.highlighter.active[bufnr] then
            if not pcall(vim.treesitter.start, bufnr) then
              return
            end
          end

          if vim.api.nvim_get_current_buf() == bufnr then
            vim.wo.foldmethod = "expr"
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.wo.foldlevel = 99
          end

          -- Treesitter indentation is opt-in on the main branch.
          vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
