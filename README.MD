# dotfiles

Personal dotfiles for Arch Linux, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

```text
dotfiles/
├── nvim/      # Neovim config (0.12+)
└── ...        # other configs
```

## Installation

```bash
git clone https://github.com/buldozer/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Install Neovim config only
stow nvim

# Or install all stow packages
stow */
```

## Neovim

This setup targets **Neovim 0.12+** and uses native **`vim.pack`** (no lazy.nvim).

### Requirements

#### System packages (Arch)

```bash
sudo pacman -S neovim git ripgrep fd stow nodejs npm python-pipx
```

#### Optional language tooling

```bash
# Python
pipx install pyright ruff

# Rust
rustup component add rust-analyzer rustfmt
```

### First run

Plugins are installed automatically by `vim.pack`.

For LSP servers on a new machine:

1. Open Mason: `<leader>mm`
2. Install core servers: `<leader>mi`
3. Update Mason registry (optional): `<leader>mu`

### Current plugin stack

- [mini.nvim](https://github.com/echasnovski/mini.nvim) (starter, surround, pairs, comment, notify, etc.)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [mason.nvim](https://github.com/mason-org/mason.nvim)
- [blink.cmp](https://github.com/Saghen/blink.cmp)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [harpoon](https://github.com/ThePrimeagen/harpoon) (harpoon2)
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [flash.nvim](https://github.com/folke/flash.nvim)
- [noice.nvim](https://github.com/folke/noice.nvim) + [nui.nvim](https://github.com/MunifTanjim/nui.nvim)
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- [vim-wakatime](https://github.com/wakatime/vim-wakatime)

### Notes

- Main config files are in `nvim/.config/nvim/lua/config/` and `nvim/.config/nvim/lua/plugins/`.
- Legacy configs are kept in `nvim/.config/nvim/lua/plugins-old/` for reference only.
