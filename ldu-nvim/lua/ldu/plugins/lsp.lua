return {
  { "williamboman/mason.nvim", config = true },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "clangd",
        "pyright",
        "rust_analyzer",
        "lua_ls",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },

    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })

      if vim.lsp.config and vim.lsp.enable then
        vim.lsp.config("clangd", {})
        vim.lsp.config("pyright", {})
        vim.lsp.config("rust_analyzer", {})

        vim.lsp.enable({ "clangd", "pyright", "rust_analyzer", "lua_ls" })
        return
      end

      local lspconfig = require("lspconfig")
      lspconfig.clangd.setup({})
      lspconfig.pyright.setup({})
      lspconfig.rust_analyzer.setup({})
    end,
  },
}
