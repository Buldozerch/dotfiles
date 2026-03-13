vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.opt.spell = true
vim.opt.spelllang = { "en_us", "ru" }

-- диагностика
vim.diagnostic.config({
  virtual_text = true,     -- текст ошибки справа от строки
  signs = true,            -- иконки в gutter
  underline = true,        -- подчёркивание строки с ошибкой
  update_in_insert = false, -- не обновлять в insert моде
  float = {
    border = "rounded",
    source = true,         -- показывать источник ошибки (pyright / ruff)
  },
})
