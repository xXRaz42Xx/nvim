local map = vim.keymap.set

-- Better escape
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Command mode without Shift
map("n", ";", ":", { desc = "Enter command mode" })

-- Save / quit
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Quit all force" })

-- Move lines
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move line up" })

-- Better indenting
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Center on search / jumps
map("n", "n", "nzzzv", { desc = "Next search (centered)" })
map("n", "N", "Nzzzv", { desc = "Prev search (centered)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })

-- Clear highlights
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear highlights" })

-- Windows
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
map("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Equal splits" })
map("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close split" })

-- Buffers (bufferline style)
map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "Close buffer" })
map("n", "<leader>X", "<cmd>bdelete!<cr>", { desc = "Force close buffer" })
map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close other buffers" })

-- Tabs (real vim tabs, not bufferline buffers)
map("n", "]t", "<cmd>tabnext<cr>", { desc = "Next tab" })
map("n", "[t", "<cmd>tabprev<cr>", { desc = "Prev tab" })

-- File explorer
map("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<cr>", { desc = "Focus file tree" })
map("n", "<leader>E", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })

-- Telescope (fuzzy finder)
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Find word" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Find in buffer" })
map("n", "<leader>fg", "<cmd>Telescope git_status<cr>", { desc = "Git status" })
map("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })

-- LSP (native, set on LspAttach too — these are fallbacks)
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gR", "<cmd>Telescope lsp_references<cr>", { desc = "References" })
map("n", "gI", "<cmd>Telescope lsp_implementations<cr>", { desc = "Implementations" })
map("n", "gy", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "Type definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>lv", "<cmd>Lazy<cr>", { desc = "LazyVim" })
map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Prev diagnostic" })
map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Next diagnostic" })
map("n", "<leader>dd", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Buffer diagnostics" })
map("n", "<leader>dD", "<cmd>Telescope diagnostics<cr>", { desc = "Workspace diagnostics" })

-- Formatting
map({ "n", "v" }, "<leader>mp", function()
  require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 500 })
end, { desc = "Format file" })

-- Terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Exit terminal mode" })
map("n", "<leader>th", "<cmd>split | terminal<cr>", { desc = "Horizontal terminal" })
map("n", "<leader>tv", "<cmd>vsplit | terminal<cr>", { desc = "Vertical terminal" })

-- Which-key / cheatsheet style
map("n", "<leader>ch", "<cmd>WhichKey<cr>", { desc = "Keymap cheatsheet" })

-- Themes
map("n", "<leader>tt", "<cmd>Telescope colorscheme<cr>", { desc = "Pick theme" })

-- Git
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "Git blame line" })
map("n", "<leader>gB", "<cmd>Telescope git_branches<cr>", { desc = "Git branches" })
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Lazygit" })
