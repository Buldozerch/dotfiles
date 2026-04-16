return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  lazy = false,
  config = function()
    vim.g.rustaceanvim = {
      server = {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy", -- используем clippy вместо cargo check
            },
          },
        },
      },
    }
  end,
}
