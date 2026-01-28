return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = true, -- if no formatter configured, fall back to LSP formatting
      },
      formatters_by_ft = {
        -- C / C++
        c = { "clang_format" },
        cpp = { "clang_format" },

        -- Python (pick one; ruff is fast)
        python = { "ruff_format" }, -- or { "black" }

        -- Lua
        lua = { "stylua" },
      },
    },
    config = function(_, opts)
      local conform = require("conform")
      conform.setup(opts)

      vim.keymap.set("n", "<leader>f", function()
        conform.format({ lsp_fallback = true })
      end, { desc = "Format buffer" })
    end,
  },
}
