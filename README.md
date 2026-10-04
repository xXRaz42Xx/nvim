# Personal Neovim Config

Custom, from-scratch nvim config — "1000% my own code".

## Requirements

- Neovim >= 0.11
- Git, `make`, a Nerd Font, `ripgrep` (`rg`), `fd`
- C compiler for treesitter / fzf-native
- Formatters (optional, via `conform.nvim` + Mason or system): `stylua`, `prettierd`/`prettier`, `ruff`/`black`, etc.

## Install

```bash
git clone https://github.com/xXRaz42Xx/nvim ~/.config/nvim && nvim
# :Lazy sync, :Mason, :checkhealth
```

## Keymaps (`<leader>` = Space)

- `jk` exit insert, `;` → `:`
- `<C-s>` save, `<leader>q` quit
- `<C-h/j/k/l>` window nav, `<leader>sv/sh/se/sx` splits
- `<Tab>/<S-Tab>` next/prev buffer, `<leader>x` close, `<leader>bo` close others
- `<C-n>` / `<leader>e` file tree
- `<leader>ff/fo/fw/fb/fh/fz/fg/fc` Telescope
- `gd/gR/gI/gy/K/<leader>ca/<leader>rn/[d/]d` LSP / diagnostics
- `<leader>mp` format (conform)
- `<leader>th/tv` terminals, `<C-x>` exit terminal mode
- `<leader>ch` cheatsheet (which-key), `<leader>tt` themes
- `<leader>xx` Trouble, `<leader>gb` git blame

## Customize

- Theme: `lua/plugins/colorscheme.lua` (`flavour = "mocha"`)
- Statusline/tabline/dashboard: `lua/plugins/ui.lua`
- LSP servers: `lua/plugins/lsp.lua` (`servers` + `ensure_installed`)
- Formatters: `lua/plugins/formatting.lua` (uncomment `format_on_save` for auto-format)
- Parsers: `lua/plugins/treesitter.lua` (`ensure_install`)
- Options/keymaps/autocmds: `lua/config/*`

## License

Copyright (C) 2026 Raz Menashe. Licensed under the GNU General Public License v3.0 or later — see [LICENSE](LICENSE).
