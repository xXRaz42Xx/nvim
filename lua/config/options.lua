local o = vim.o
local opt = vim.opt

o.number = true
o.relativenumber = true
o.numberwidth = 2

o.mouse = "a"
o.clipboard = "unnamedplus"
o.undofile = true
o.undolevels = 10000
o.swapfile = false
o.backup = false
o.writebackup = false

o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.smartindent = true
o.breakindent = true

o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true

o.termguicolors = true
o.signcolumn = "yes"
o.cursorline = true
o.cursorlineopt = "number"
o.scrolloff = 8
o.sidescrolloff = 8
o.wrap = false
o.linebreak = true
o.showmode = false
o.laststatus = 3
o.cmdheight = 1
o.pumheight = 10
o.showtabline = 2

o.splitbelow = true
o.splitright = true
o.splitkeep = "screen"

o.updatetime = 250
o.timeoutlen = 400
o.ttimeoutlen = 10

o.completeopt = "menu,menuone,noselect"
o.wildmode = "longest:full,full"

o.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true

-- Netrw replacement: we use nvim-tree / oil, disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Providers: disable unused to speed startup
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
