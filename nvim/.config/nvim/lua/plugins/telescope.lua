return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  keys = {
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Search by text" },
    { "<leader>fw", "<cmd>Telescope grep_string<CR>", desc = "Search current word" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup()
    telescope.load_extension("fzf")
  end,
}
