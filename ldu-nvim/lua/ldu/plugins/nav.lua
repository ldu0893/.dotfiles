return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({})
      telescope.load_extension("fzf")

      local b = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", b.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", b.live_grep,  { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", b.buffers,    { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fs", b.lsp_document_symbols, { desc = "Doc symbols" })
      vim.keymap.set("n", "<leader>fr", b.lsp_references, { desc = "LSP references" })
    end,
  },
}
