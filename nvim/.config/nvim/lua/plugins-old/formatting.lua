return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "ruff_organize_imports", "ruff_format" },
        rust = { "rustfmt" },
      },
      format_on_save = { timeout_ms = 500 },
    })
  end,
}
