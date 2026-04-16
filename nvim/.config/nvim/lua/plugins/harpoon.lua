local function setup()
  local harpoon = require("harpoon")
  local conf = require("telescope.config").values

  local function toggle_telescope(harpoon_files)
    local file_paths = {}

    for _, item in ipairs(harpoon_files.items) do
      table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table({
        results = file_paths,
      }),
      previewer = conf.file_previewer({}),
      sorter = conf.generic_sorter({}),
    }):find()
  end

  harpoon:setup()

  local map = vim.keymap.set

  map("n", "<leader>ha", function()
    harpoon:list():add()
  end, { desc = "Harpoon: Add current file" })

  map("n", "<leader>hh", function()
    harpoon.ui:toggle_quick_menu(harpoon:list(), {
      border = "rounded",
      title = "Harpoon",
      title_pos = "center",
      ui_width_ratio = 0.5,
      ui_max_width = 120,
      height_in_lines = 10,
    })
  end, { desc = "Harpoon: Toggle quick menu" })

  map("n", "<C-e>", function()
    toggle_telescope(harpoon:list())
  end, { desc = "Harpoon: Telescope menu" })

  for i = 1, 5 do
    map("n", "<leader>" .. i, function()
      harpoon:list():select(i)
    end, { desc = "Harpoon: Go to file " .. i })
  end

  map("n", "<C-S-N>", function()
    harpoon:list():next()
  end, { desc = "Harpoon: Next" })

  map("n", "<C-S-P>", function()
    harpoon:list():prev()
  end, { desc = "Harpoon: Prev" })
  
end

return { setup = setup }
