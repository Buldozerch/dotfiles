vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.cmd.colorscheme("tokyonight")
vim.opt.showmode = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.wrap = false

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.selection = "inclusive"
vim.opt.iskeyword:append("-")

vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 50

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.spelllang = { "en_us", "ru" }

vim.opt.signcolumn = "yes"
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winblend = 0
vim.opt.showmatch = true
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""
vim.opt.wildmode = "longest:full,full"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = undodir
vim.opt.autoread = true

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000
vim.opt.diffopt:append("linematch:60")
