return {
  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        layout_config = { horizontal = { prompt_position = "top" } },
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      pcall(telescope.load_extension, "fzf")
    end,
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = { { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle tree" } },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      view = { width = 30, side = "left" },
      renderer = { group_empty = true, highlight_git = true },
      filters = { dotfiles = false },
      git = { enable = true, ignore = false },
      actions = { open_file = { quit_on_open = false } },
    },
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- Comments (gc to comment)
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- Surround (ys, ds, cs)
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- Trouble diagnostics list
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle" },
    keys = {
      { "<leader>dx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>dX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics" },
    },
    opts = {},
  },
}
