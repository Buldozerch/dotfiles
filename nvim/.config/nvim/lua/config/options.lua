-- ============================================================================
-- OPTIONS.LUA - Основные настройки Neovim
-- ============================================================================


-- ВНЕШНИЙ ВИД И НАВИГАЦИЯ ---------------------------------------------------
vim.opt.number = true              -- Показывать номера строк
vim.opt.relativenumber = true      -- Относительные номера (удобно для 5j/3k)
vim.opt.cursorline = true          -- Подсвечивать строку с курсором
vim.opt.termguicolors = true       -- Полная поддержка цветов (true color)
vim.cmd.colorscheme("tokyonight")      -- Тема Sorbet
vim.opt.showmode = false           -- Не показывать -- INSERT -- (статуслайн покажет)
vim.opt.scrolloff = 10             -- 10 строк запаса сверху/снизу курсора
vim.opt.sidescrolloff = 10         -- 10 символов запаса слева/справа
vim.opt.wrap = false               -- НЕ переносить длинные строки
vim.opt.encoding = "utf-8"         -- set encoding

-- ТАБЫ И ОТПУСКИ ------------------------------------------------------------
vim.opt.tabstop = 2                -- Tab = 2 пробела (визуально)
vim.opt.shiftwidth = 2             -- >>/<< = 2 пробела
vim.opt.softtabstop = 2            -- Tab/Backspace двигается на 2 пробела
vim.opt.expandtab = true           -- Заменять Tab пробелами
vim.opt.smartindent = true         -- Умный автоотступ по синтаксису
vim.opt.autoindent = true          -- Копировать отступ предыдущей строки

-- БУФЕР ОБМЕНА И МЫШЬ ------------------------------------------------------
vim.opt.clipboard = "unnamedplus"  -- Синхронизация с системным буфером
vim.opt.mouse = "a"                -- Поддержка мыши во всех режимах
vim.opt.selection = "inclusive"    -- Включать последний символ в выделение
vim.opt.iskeyword:append("_")      -- только подчёркивание
vim.opt.iskeyword:append("-")   

-- СКОРОСТЬ И ТАЙМЕРА --------------------------------------------------------
vim.opt.updatetime = 300           -- Быстрее LSP/диагностика (по умолчанию 4000)
vim.opt.timeoutlen = 500           -- Время ожидания leader-комбинаций (мс)
vim.opt.ttimeoutlen = 50           -- Быстрый Escape из терминала

-- ПОИСК И ОРФОГРАФИЯ --------------------------------------------------------
vim.opt.ignorecase = false          -- Поиск без учёта регистра
vim.opt.smartcase = true           -- Но чувствителен, если есть ЗАГЛАВНЫЕ
vim.opt.hlsearch = true            -- Подсвечивать все совпадения
vim.opt.incsearch = true           -- Показывать на лету при вводе
vim.opt.spell = true               -- Проверка орфографии
vim.opt.spelllang = { "en_us", "ru" }  -- Английский + русский

-- АВТОДОПОЛНЕНИЕ И UI -------------------------------------------------------
vim.opt.signcolumn = "yes"         -- Всегда показывать колонку с иконками
vim.opt.cmdheight = 1              -- 1 строка для командной строки
vim.opt.completeopt = "menuone,noinsert,noselect"  -- Умное автодополнение
vim.opt.pumheight = 10             -- Максимум 10 строк в popup меню
vim.opt.pumblend = 10              -- Прозрачность popup (10%)
vim.opt.winblend = 0               -- Прозрачность окон (0%)
vim.opt.showmatch = true           -- Подсвечивать парные скобки
vim.opt.conceallevel = 0           -- Не скрывать markdown символы
vim.opt.concealcursor = ""         -- Показывать cursorline в markup
vim.opt.lazyredraw = true          -- Быстрее макросы (не перерисовывать)
vim.opt.wildmenu = true            -- Визуальное меню Tab-дополнения
vim.opt.wildmode = "longest:full,full"  -- Умное дополнение команд

-- FOLDING (СКЛАДЫВАНИЕ КОДА) ------------------------------------------------
vim.opt.foldmethod = "expr"        -- Folding по выражению
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"  -- Tree-sitter парсинг
vim.opt.foldlevel = 99             -- Развёрнуто всё по умолчанию (zc/zo)

-- ФАЙЛЫ И ПЕРСИСТЕНТНЫЙ UNDO -----------------------------------------------
local undodir = vim.fn.expand("~/.vim/undodir")  -- Папка для undo файлов
if vim.fn.isdirectory(undodir) == 0 then          -- Если папки нет
  vim.fn.mkdir(undodir, "p")                      -- Создать рекурсивно
end

vim.opt.hidden = true              -- Позволяет скрывать буферы без сохранения
vim.opt.backup = false             -- НЕ создавать *.bak файлы
vim.opt.writebackup = false        -- НЕ бэкапить при записи
vim.opt.swapfile = false           -- НЕ создавать *.swp файлы
vim.opt.undofile = true            -- ВКЛЮЧИТЬ persistent undo (u между сессиями!)
vim.opt.undodir = undodir          -- Хранить undo в ~/.vim/undodir/
vim.opt.autoread = true            -- Автозагрузка при git pull
vim.opt.autowrite = false          -- НЕ автосохранять при :next

-- ОПТИМИЗАЦИЯ СТАРТА (отключаем ненужное) ----------------------------------
vim.g.loaded_perl_provider = 0     -- Отключить Perl провайдер
vim.g.loaded_ruby_provider = 0     -- Отключить Ruby провайдер

-- БОЛЬШИЕ ФАЙЛЫ И DIFF -----------------------------------------------------
vim.opt.redrawtime = 10000         -- Больше времени на подсветку
vim.opt.maxmempattern = 20000      -- Больше памяти для поиска
vim.opt.diffopt:append("linematch:60")  -- Лучшее выравнивание в diff

-- LSP ДИАГНОСТИКА (современный стиль 0.12+) ---------------------------------
local sev = vim.diagnostic.severity

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",                -- Красивый маркер вместо [E/W]
  },
  signs = {
    text = {
      [sev.ERROR] = " ",        -- 🚨 Error иконка
      [sev.WARN]  = " ",        -- ⚠️ Warning
      [sev.INFO]  = " ",        -- ℹ️ Info
      [sev.HINT]  = " ",        -- 💡 Hint
    },
  },
  underline = true,                -- Подчёркивание ошибок
  update_in_insert = false,        -- Не обновлять в INSERT режиме
  severity_sort = true,            -- Сортировать по важности
  float = {
    border = "rounded",            -- Скруглённые окна диагностики
    source = "if_many",            -- Источник только при множестве
    header = "",                   -- Без заголовка
    prefix = "",                   -- Без префикса
  },
})
