-- lazy.nvim setup — single entry point, called from init.lua
local lazy_opts = {
  defaults = { lazy = true },
  install = { colorscheme = { "catppuccin" } },
  checker = { enabled = false },
  change_detection = { notify = false },
  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
    border = "rounded",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
}

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
}, lazy_opts)
