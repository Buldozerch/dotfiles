local map = vim.keymap.set

-- выход из insert мода
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- сохранить файл
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>wq", "<cmd>wq<CR>", { desc = "Save and quit" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- файловое дерево
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle file tree" })
map("n", "<leader>ef", "<cmd>Neotree reveal<CR>", { desc = "Reveal file in tree" })

-- навигация между окнами
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })

-- закрыть буфер
map("n", "<leader>x", "<cmd>bd<CR>", { desc = "Close buffer" })
map("n", "<leader>X", "<cmd>bd!<CR>", { desc = "Force close buffer" })

-- diagnostics
map("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show diagnostic" })
map("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })

-- search
map("n", "<leader>/", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
