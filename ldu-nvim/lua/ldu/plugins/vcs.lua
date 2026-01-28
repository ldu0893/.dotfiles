return {
  "mhinz/vim-signify",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    vim.o.updatetime = 100
    vim.g.signify_update_on_bufenter = 1
    vim.g.signify_update_on_focusgained = 1
    vim.g.signify_update_on_insert_leave = 1

    vim.api.nvim_create_autocmd("BufWritePost", {
      callback = function() pcall(vim.cmd, "silent! SignifyUpdate") end,
    })

    vim.g.signify_vcs_list               = { "hg" } -- Mercurial

    vim.g.signify_sign_add               = "┃"
    vim.g.signify_sign_delete            = "┃"
    vim.g.signify_sign_delete_first_line = "┃"
    vim.g.signify_sign_change            = "┃"
    vim.g.signify_sign_changedelete      = "┃"

    vim.wo.signcolumn                    = "yes"

    local opts                           = { silent = true, noremap = true }

    vim.keymap.set("n", "]c", "<plug>(signify-next-hunk)", opts)
    vim.keymap.set("n", "[c", "<plug>(signify-prev-hunk)", opts)

    vim.keymap.set("n", "<leader>ghp", ":SignifyHunkDiff<cr>", { desc = "Preview Hunk" })
    vim.keymap.set("n", "<leader>ghu", ":SignifyHunkUndo<cr>", { desc = "Undo Hunk" })
    vim.keymap.set("n", "<leader>ghl", ":SignifyToggleHighlight<cr>", { desc = "Toggle Line Highlight" })
  end,
}
