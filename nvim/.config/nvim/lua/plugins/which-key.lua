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
      { "<leader>h", group = "harpoon" },
      { "ys", group = "surround add" },
      { "cs", group = "surround change" },
      { "ds", group = "surround delete" },
      { "ysiw\"", desc = "Surround word with \"" },
      { "ysiw(", desc = "Surround word with ()" },
      { "cs\"'", desc = "Change \" to '" },
      { "ds\"", desc = "Delete surrounding \"" },
    })
  end,
}
