local function setup()
  local gitsigns = require("gitsigns")

  gitsigns.setup({
    signs = {
      add = { text = "\u{2590}" }, -- ▏
      change = { text = "\u{2590}" }, -- ▐
      delete = { text = "\u{2590}" }, -- ◦
      topdelete = { text = "\u{25e6}" }, -- ◦
      changedelete = { text = "\u{25cf}" }, -- ●
      untracked = { text = "\u{25cb}" }, -- ○
    },
    signcolumn = true,
    current_line_blame = false,
    on_attach = function(bufnr)
      local map = vim.keymap.set
      local function opts(desc)
        return { buffer = bufnr, silent = true, desc = desc }
      end

      map("n", "]h", gitsigns.next_hunk, opts("Git: Next hunk"))
      map("n", "[h", gitsigns.prev_hunk, opts("Git: Prev hunk"))

      map("n", "<leader>hs", gitsigns.stage_hunk, opts("Git: Stage hunk"))
      map("n", "<leader>hr", gitsigns.reset_hunk, opts("Git: Reset hunk"))
      map("n", "<leader>hp", gitsigns.preview_hunk, opts("Git: Preview hunk"))
      map("n", "<leader>hb", function()
        gitsigns.blame_line({ full = true })
      end, opts("Git: Blame line"))
      map("n", "<leader>hB", gitsigns.toggle_current_line_blame, opts("Git: Toggle inline blame"))
      map("n", "<leader>hd", gitsigns.diffthis, opts("Git: Diff this"))
    end,
  })
end

return { setup = setup }
