-- lua/plugins/harpoon.lua
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    local map = vim.keymap.set

    -- добавить файл в список
    map("n", "<leader>ha", function() harpoon:list():add() end,    { desc = "Harpoon add file" })
    -- открыть меню со списком
    map("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })

    -- прыжки по номеру
    map("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
    map("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
    map("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
    map("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })
    map("n", "<leader>5", function() harpoon:list():select(4) end, { desc = "Harpoon file 5" })
  end,
}
