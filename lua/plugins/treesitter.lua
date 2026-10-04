return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_install = {
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "markdown",
        "markdown_inline",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
        "toml",
        "python",
        "go",
        "rust",
      },
    },
    config = function(_, opts)
      local ts = require("nvim-treesitter")
      -- nvim-treesitter main-branch API
      if ts.install then
        ts.install(opts.ensure_install)
      end

      -- Enable treesitter highlight + indent per buffer
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("TreesitterEnable", { clear = true }),
        callback = function(args)
          local buf = args.buf
          local ft = vim.bo[buf].filetype
          -- skip special buffers
          if ft == "" or vim.bo[buf].buftype ~= "" then
            return
          end
          pcall(vim.treesitter.start, buf)
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
