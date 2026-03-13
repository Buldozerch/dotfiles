local map = vim.keymap.set

-- выход из insert мода
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- сохранить файл
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })

-- сохранить и выйти
map("n", "<leader>wq", "<cmd>wq<CR>", { desc = "Save and quit" })

map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- открыть/закрыть дерево файлов
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle file tree" })

-- показать текущий файл в дереве
map("n", "<leader>ef", "<cmd>Neotree reveal<CR>", { desc = "Reveal file in tree" })

-- навигация между окнами
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })

-- buffers
map("n", "<leader>n", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<leader>p", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
map("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", { desc = "Buffer 1" })
map("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", { desc = "Buffer 2" })
map("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", { desc = "Buffer 3" })
map("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", { desc = "Buffer 4" })
map("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", { desc = "Buffer 5" })
map("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", { desc = "Buffer 6" })
map("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", { desc = "Buffer 7" })
map("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", { desc = "Buffer 8" })
map("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", { desc = "Buffer 9" })
map("n", "<leader>0", "<cmd>BufferLineGoToBuffer 10<CR>", { desc = "Buffer 10" })
-- buffer close
map("n", "<leader>x", "<cmd>Bdelete<CR>", { desc = "Close current buffer" })
map("n", "<leader>X", "<cmd>Bdelete!<CR>", { desc = "Force close current buffer" })

-- diagnostics
map("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show diagnostic" })
map("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })

-- search
map("n", "<leader>/", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
