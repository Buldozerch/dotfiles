# dotfiles

My personal dotfiles for Arch Linux, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

```
dotfiles/
├── nvim/ — Neovim configuration
└── ... — more configs coming
```

## Installation

```bash
git clone https://github.com/buldozer/dotfiles.git ~/dotfiles
cd ~/dotfiles

# install specific config
stow nvim

# or install everything
stow */
```

## Neovim

Python and Rust development setup.

### Requirements

#### System packages

```bash
sudo pacman -S neovim ripgrep nodejs npm stow python-pipx
```

#### Python tooling

```bash
pipx install basedpyright
pipx install ruff
```

#### Rust tooling

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-analyzer rustfmt
```

#### Node.js provider

```bash
npm install -g neovim
```

### Plugins

- [lazy.nvim](https://github.com/folke/lazy.nvim) — plugin manager  
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) — colorscheme  
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) — LSP configuration  
- [rustaceanvim](https://github.com/mrcjkb/rustaceanvim) — Rust LSP  
- [blink.cmp](https://github.com/Saghen/blink.cmp) — autocompletion  
- [conform.nvim](https://github.com/stevearc/conform.nvim) — formatting  
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) — syntax highlighting  
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) — fuzzy finder  
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) — file explorer  
- [alpha-nvim](https://github.com/goolord/alpha-nvim) — start screen  
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) — statusline  
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) — buffer tabs  
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) — git integration  
- [which-key.nvim](https://github.com/folke/which-key.nvim) — keybinding hints  
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) — auto brackets  
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) — commenting  
- [nvim-surround](https://github.com/kylechui/nvim-surround) — surround motions  
- [flash.nvim](https://github.com/folke/flash.nvim) — navigation  
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) — highlight TODOs  
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) — indent guides  
- [neoscroll.nvim](https://github.com/karb94/neoscroll.nvim) — smooth scrolling  
