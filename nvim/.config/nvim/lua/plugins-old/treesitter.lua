return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "python", "rust", "lua", "vim", "vimdoc" },
      auto_install = true,
      highlight = { enable = true },
    })
  end,
}
