local function setup()
  local wk = require("which-key")

  wk.setup({
    preset = "classic",
    delay = 220,
    win = {
      border = "rounded",
      title = true,
      wo = {
        winblend = 0,
      },
    },
    layout = {
      spacing = 6,
    },
    icons = {
      breadcrumb = "»",
      separator = "→",
      group = "+",
    },
    sort = { "group", "alphanum", "order" },
    spec = {
      { "<leader>f", group = "Find" },
      { "<leader>h", group = "Harpoon/Git" },
      { "<leader>d", group = "Diagnostics" },
      { "<leader>s", group = "Split" },
      { "<leader>w", group = "Write/Quit" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "LSP" },
      { "<leader>m", group = "Mason" },

      { "<leader>ff", desc = "Find files" },
      { "<leader>fi", desc = "Find in files/" },
      { "<leader>fg", desc = "Live grep" },
      { "<leader>fw", desc = "Grep current word" },
      { "<leader>fb", desc = "Find buffers" },
      { "<leader>fh", desc = "Find help tags" },

      { "<leader>ha", desc = "Add current file" },
      { "<leader>hh", desc = "Quick menu" },

      { "[h", desc = "Git prev hunk" },
      { "]h", desc = "Git next hunk" },
      { "<leader>hs", desc = "Git stage hunk" },
      { "<leader>hr", desc = "Git reset hunk" },
      { "<leader>hp", desc = "Git preview hunk" },
      { "<leader>hb", desc = "Git blame line" },
      { "<leader>hB", desc = "Git toggle inline blame" },
      { "<leader>hd", desc = "Git diff this" },

      { "<leader>dd", desc = "Show diagnostic" },
      { "<leader>dn", desc = "Next diagnostic" },
      { "<leader>dp", desc = "Prev diagnostic" },

      { "<leader>ld", desc = "LSP definition" },
      { "<leader>lD", desc = "LSP declaration" },
      { "<leader>lr", desc = "LSP references" },
      { "<leader>li", desc = "LSP implementation" },
      { "<leader>lt", desc = "LSP type definition" },
      { "<leader>ln", desc = "LSP rename" },
      { "<leader>la", desc = "LSP code action" },
      { "<leader>ls", desc = "LSP document symbols" },
      { "<leader>lS", desc = "LSP workspace symbols" },
      { "<leader>lf", desc = "LSP format buffer" },
      { "<leader>mi", desc = "Mason install" },
      { "<leader>mm", desc = "Mason UI" },

      { "<leader>e", desc = "Toggle nvim-tree" },
      { "<leader>w", desc = "Save file" },
      { "<leader>wq", desc = "Save and quit" },
      { "<leader>q", desc = "Quit" },
      { "<leader>x", desc = "Close buffer" },
      { "<leader>X", desc = "Force close buffer" },
      { "<leader>sv", desc = "Split vertically" },
      { "<leader>sh", desc = "Split horizontally" },
      { "<leader>/", desc = "Clear search highlight" },

      { "gsa", desc = "Surround add" },
      { "gsd", desc = "Surround delete" },
      { "gsr", desc = "Surround replace" },
      { "gsf", desc = "Surround find right" },
      { "gsF", desc = "Surround find left" },
      { "gsh", desc = "Surround highlight" },
      { "gsn", desc = "Surround update n lines" },
    },
  })
end

return { setup = setup }
