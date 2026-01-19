# MNvim

My Neovim config. Built from scratch to understand every piece.

## What I use (mostly)

- **Plugin manager**: lazy.nvim
- **Theme**: TokyoNight Night
- **File explorer**: neo-tree
- **Fuzzy finder**: telescope
- **LSP**: nvim-lspconfig + mason
- **Completion**: nvim-cmp
- **Formatting**: conform.nvim
- **Linting**: nvim-lint
- **Syntax**: treesitter (pinned to v0.9.x because newer versions broke things)
- **Statusline**: lualine
- **Dashboard**: alpha-nvim

## Languages

Set up for:

- Lua
- C/C++
- Rust
- TypeScript/React

## Structure

```
~/.config/MNvim/
├── init.lua
└── lua/memnoc/
    ├── core/
    │   ├── init.lua
    │   ├── options.lua
    │   └── keymaps.lua
    ├── lazy.lua
    └── plugins/
        ├── alpha.lua
        ├── colorscheme.lua
        ├── lualine.lua
        ├── neo-tree.lua
        ├── telescope.lua
        ├── treesitter.lua
        ├── which-key.lua
        └── lsp/
            ├── lspconfig.lua
            └── mason.lua
```

## Requirements

- Neovim 0.9+
- git
- A Nerd Font
- ripgrep (for telescope)
- Node.js (for web dev LSPs)
- Rust toolchain (if doing Rust)
- clang (if doing C/C++)

## Install

Back up your existing config, then:

```bash
git clone https://github.com/yourusername/MNvim ~/.config/MNvim
NVIM_APPNAME=MNvim nvim
```

Lazy will install plugins on first launch.

## Keymaps

Leader is `<Space>`.

| Key          | Action               |
| ------------ | -------------------- |
| `<leader>e`  | Toggle file explorer |
| `<leader>ff` | Find files           |
| `<leader>fg` | Live grep            |
| `<leader>qq` | Quit                 |
| `<C-s>`      | Save                 |
| `gd`         | Go to definition     |
| `K`          | Hover docs           |
| `<leader>ca` | Code actions         |
| `<leader>rn` | Rename               |
| `<leader>mp` | Format               |
| `<leader>l`  | Lint                 |

## Notes

- Treesitter is pinned to v0.9.x because the API changed and broke telescope
- Rustaceanvim handles Rust instead of plain rust-analyzer
- Format on save is enabled
- Massive shoutout to whomever made the [ASCII art](https://emojicombos.com/anime-ascii-art)

## Known issues

Sometimes things break after plugin updates. When in doubt:

```vim
:Lazy clean
:Lazy sync
```

If that doesn't work, delete `~/.local/share/MNvim/lazy` and restart.
