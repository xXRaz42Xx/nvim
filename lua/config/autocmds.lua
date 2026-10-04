local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Resize splits on window resize
augroup("ResizeSplits", { clear = true })
autocmd("VimResized", {
  group = "ResizeSplits",
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Close some filetypes with <q>
autocmd("FileType", {
  group = augroup("CloseWithQ", { clear = true }),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "checkhealth",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Wrap + spell for text files
autocmd("FileType", {
  group = augroup("TextWrap", { clear = true }),
  pattern = { "gitcommit", "markdown", "text" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Auto-create dir when saving a file
autocmd("BufWritePre", {
  group = augroup("AutoCreateDir", { clear = true }),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- LSP: keymaps + inlay hints on attach (Neovim 0.11+ native)
autocmd("LspAttach", {
  group = augroup("LspAttach", { clear = true }),
  callback = function(event)
    local function lsp_map(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    lsp_map("gd", require("telescope.builtin").lsp_definitions, "Goto definition")
    lsp_map("gr", require("telescope.builtin").lsp_references, "Goto references")
    lsp_map("gI", require("telescope.builtin").lsp_implementations, "Goto implementation")
    lsp_map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type definition")
    lsp_map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Document symbols")
    lsp_map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace symbols")
    lsp_map("<leader>rn", vim.lsp.buf.rename, "Rename")
    lsp_map("<leader>ca", vim.lsp.buf.code_action, "Code action")
    lsp_map("K", vim.lsp.buf.hover, "Hover")
    lsp_map("gD", vim.lsp.buf.declaration, "Goto declaration")

    -- Inlay hints toggle
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method("textDocument/inlayHint") then
      lsp_map("<leader>ti", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
      end, "Toggle inlay hints")
    end
  end,
})
