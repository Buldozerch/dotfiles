local function setup()
  local telescope = require("telescope")
  local builtin = require("telescope.builtin")

  telescope.setup({})

  vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })

  vim.keymap.set("n", "<leader>fi", function()
    builtin.find_files({
      search_dirs = { "files" },
      no_ignore = true,
    })
  end, { desc = "Find in files/" })

  vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search by text" })
  vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Search current word" })
  vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
  vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
end

return { setup = setup }
