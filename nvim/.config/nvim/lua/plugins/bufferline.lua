return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "famiu/bufdelete.nvim",
  },
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        close_command = "Bdelete! %d",
      },
    })
  end,
}
