local api = require("nvim-tree.api")

local function setup()
  require("nvim-tree").setup({
    view = { width = 35 },
    renderer = {
      group_empty = true,
    },
    filters = { dotfiles = false },
  })

  vim.keymap.set("n", "<leader>e", function()
    require("nvim-tree.api").tree.toggle()
  end, { desc = "Toggle NvimTree" })
  vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
  vim.api.nvim_set_hl(0, "NvimTreeSignColumn", { bg = "none" })
  vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#2a2a2a", bg = "none" })
  vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })

end

return { setup = setup }
