local map = vim.keymap.set

-- ============================================================================
-- Общие
-- ============================================================================

-- LEADER КЛАВИШИ ------------------------------------------------------------
vim.g.mapleader = " "        -- Глобальный лидер = ПРОБЕЛ
vim.g.maplocalleader = " "   -- Локальный лидер = ПРОБЕЛ

-- Выход из Insert mode (jj → Esc)
map("i", "jj", "<Esc>", { desc = "Exit insert mode", silent = true })

-- Сохранение и выход
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file", silent = true })
map("n", "<leader>wq", "<cmd>wq<CR>", { desc = "Save and quit", silent = true })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit", silent = true })

-- ============================================================================
-- Навигация
-- ============================================================================

-- Переключение между окнами
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window", silent = true })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window", silent = true })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window", silent = true })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window", silent = true })

-- Закрытие буфера
map("n", "<leader>x", "<cmd>bd<CR>", { desc = "Close buffer", silent = true })
map("n", "<leader>X", "<cmd>bd!<CR>", { desc = "Force close buffer", silent = true })

map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })
-- ============================================================================
-- Diagnostics (современный стиль 0.12)
-- ============================================================================

-- Helper для next/prev с автоматическим float
local function diagnostic_goto(next, severity)
  vim.diagnostic.jump({
    count = next and 1 or -1,
    severity = severity,
    on_jump = function()
      vim.diagnostic.open_float(nil, { scope = "cursor", focus = false })
    end,
  })
end

map("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show diagnostic", silent = true })
map("n", "<leader>dn", function() diagnostic_goto(true) end, { desc = "Next diagnostic", silent = true })
map("n", "<leader>dp", function() diagnostic_goto(false) end, { desc = "Prev diagnostic", silent = true })

-- ============================================================================
-- Поиск
-- ============================================================================

map("n", "<leader>/", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight", silent = true })

-- ============================================================================
-- Новые фичи 0.12
-- ============================================================================

map("n", "<leader>R", "<cmd>restart<CR>", { desc = "Restart Neovim (0.12+)", silent = true })

-- ============================================================================
-- Mason
-- ============================================================================

map("n", "<leader>mm", "<cmd>Mason<CR>", { desc = "Open Mason", silent = true })
map("n", "<leader>mi", "<cmd>MasonInstall lua-language-server basedpyright rust-analyzer typescript-language-server<CR>", { desc = "Install core LSP servers", silent = true })
