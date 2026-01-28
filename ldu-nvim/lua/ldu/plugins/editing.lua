return {
  -- gc to comment (line/block)
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- surround operations (add/change/delete surrounds)
  {
    "echasnovski/mini.surround",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.surround").setup()
    end,
  },

  -- auto close (), {}, "", etc.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- fast in-file jumping (s to jump)
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", function() require("flash").jump() end,       mode = { "n", "x", "o" }, desc = "Flash jump" },
      { "S", function() require("flash").treesitter() end, mode = { "n", "x", "o" }, desc = "Flash treesitter" },
    },
  },
}
