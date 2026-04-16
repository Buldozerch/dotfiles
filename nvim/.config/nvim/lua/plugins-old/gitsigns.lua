return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = vim.keymap.set
        local opts = { buffer = bufnr }

        -- навигация по изменениям
        map("n", "<leader>gn", gs.next_hunk, vim.tbl_extend("force", opts, { desc = "Next hunk" }))
        map("n", "<leader>gp", gs.prev_hunk, vim.tbl_extend("force", opts, { desc = "Prev hunk" }))

        map("n", "<leader>gd", gs.diffthis, vim.tbl_extend("force", opts, { desc = "Diff this" }))
        map("n", "<leader>gb", gs.blame_line, vim.tbl_extend("force", opts, { desc = "Blame line" }))
      end,
    })
  end,
}
