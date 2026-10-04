return {
  -- Mason: LSP / formatter installer
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ui = { border = "rounded", icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" } },
    },
  },

  -- Bridge mason <-> lspconfig
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        "jsonls",
        "ts_ls",
        "clangd",
        "gopls",
        -- uncomment what you need:
        -- "pyright", "rust_analyzer", "tailwindcss", "yamlls", "bashls",
      },
      automatic_installation = true,
    },
  },

  -- Native LSP config (Neovim 0.11+ vim.lsp.config API)
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "saghen/blink.cmp" },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Defaults for all servers
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- C/C++
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
        },
        filetypes = { "c", "cpp", "objc", "objcpp" },
      })

      -- Go
      vim.lsp.config("gopls", {
        cmd = { "gopls" },
        filetypes = { "go", "gomod" },
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              unusedwrite = true,
              pointerescape = false,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterTypes = true,
              rangeVariableTypes = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            experiments = {
              allowModalState = true,
              enablePostfixCompletions = true,
            },
          },
        },
      })

      -- Lua (neovim config dev)
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
            telemetry = { enable = false },
          },
        },
      })

      -- Enable the core set. Add/remove servers here.
      local servers = { "lua_ls", "html", "cssls", "jsonls", "ts_ls", "clangd", "gopls" }
      vim.lsp.enable(servers)

      -- Diagnostics UI (rounded)
      vim.diagnostic.config({
        virtual_text = { prefix = "●", spacing = 2 },
        float = { border = "rounded", source = "if_many" },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },

  -- Lazygit
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
  },
}
