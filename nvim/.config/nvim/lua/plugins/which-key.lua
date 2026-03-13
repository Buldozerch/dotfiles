return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup()

    wk.add({
      { "<leader>f", group = "search" },
      { "<leader>d", group = "diagnostics" },
      { "<leader>e", group = "explorer" },
      { "<leader>w", group = "file" },
      { "<leader>r", group = "refactor" },
      { "<leader>g", group = "git" },
      { "<leader>l", group = "lsp" },
      { "ys", group = "surround add" },
      { "cs", group = "surround change" },
      { "ds", group = "surround delete" },

      -- скрываем буферные биндинги
      { "<leader>n", hidden = true },
      { "<leader>p", hidden = true },
      { "<leader>0", hidden = true },
      { "<leader>1", hidden = true },
      { "<leader>2", hidden = true },
      { "<leader>3", hidden = true },
      { "<leader>4", hidden = true },
      { "<leader>5", hidden = true },
      { "<leader>6", hidden = true },
      { "<leader>7", hidden = true },
      { "<leader>8", hidden = true },
      { "<leader>9", hidden = true },
      { "<leader>X", hidden = true },
      -- surround подсказки
      { "ysiw\"", desc = "Surround word with \"" },
      { "ysiw(", desc = "Surround word with ()" },
      { "cs\"'", desc = "Change \" to '" },
      { "ds\"", desc = "Delete surrounding \"" },
    })
  end,
}
