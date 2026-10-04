return {
  -- Statusline (global)
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  -- Tabline / bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        mode = "buffers",
        separator_style = "thin",
        show_buffer_close_icons = false,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
        offsets = {
          { filetype = "NvimTree", text = "File Explorer", text_align = "center", separator = true },
        },
      },
    },
  },

  -- Dashboard
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "                      ",
        "  ▄▄         ▄ ▄▄▄▄▄▄▄",
        "▄▀███▄     ▄██ █████▀ ",
        "██▄▀███▄   ███        ",
        "███  ▀███▄ ███        ",
        "███    ▀██ ███        ",
        "███      ▀ ███        ",
        "▀██ █████▄▀█▀▄██████▄ ",
        "  ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀",
        "                      ",
      }

      dashboard.section.buttons.val = {
        dashboard.button("ff", "  Find File", ":Telescope find_files<CR>"),
        dashboard.button("fo", "  Recent Files", ":Telescope oldfiles<CR>"),
        dashboard.button("fw", "󰈭  Find Word", ":Telescope live_grep<CR>"),
        dashboard.button("e", "  New File", ":ene <BAR> startinsert<CR>"),
        dashboard.button("c", "  Config", ":e $MYVIMRC<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }

      dashboard.section.footer.val = function()
        local stats = require("lazy").stats()
        return " Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins"
      end

      alpha.setup(dashboard.config)
    end,
  },

  -- Keymap cheatsheet
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay = 300,
      spec = {
        { "<leader>f", group = "Find/Telescope" },
        { "<leader>s", group = "Split/Window" },
        { "<leader>g", group = "Git" },
        { "<leader>d", group = "Diagnostics" },
        { "<leader>m", group = "Format" },
        { "<leader>t", group = "Terminal/Theme" },
        { "<leader>b", group = "Buffers" },
        { "<leader>lv", group = "LazyVim" },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer keymaps",
      },
    },
  },

  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      indent = { char = "│" },
      scope = { enabled = true },
    },
  },

  -- Todo comments
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = true, opts = {} },
}
