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
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    {
      "<leader>fi",
      function()
        require("telescope.builtin").find_files({
          search_dirs = { "files" },
          no_ignore = true,   -- Игнорировать .gitignore для этой папки
        })
      end,
      desc = "Find in files/",
    },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Search by text" },
    { "<leader>fw", "<cmd>Telescope grep_string<CR>", desc = "Search current word" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup()
    telescope.load_extension("fzf")
  end,
}
