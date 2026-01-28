return {
  -- Pick ONE to start; you can keep multiple installed.
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight")
      -- other options: tokyonight-day, tokyonight-storm, tokyonight-moon
    end,
  },

  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme("catppuccin-mocha")
  --   end,
  -- },
}
