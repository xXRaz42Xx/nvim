return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = false,
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        mason = true,
        which_key = true,
        telescope = { enabled = true },
        indent_blankline = { enabled = true },
        native_lsp = {
          enabled = true,
          underlines = { errors = { "undercurl" }, hints = { "undercurl" }, warnings = { "undercurl" }, information = { "undercurl" } },
        },
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
