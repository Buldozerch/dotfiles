return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- BasedPyright (type checking + intelligence)
    vim.lsp.config("basedpyright", {
      capabilities = vim.tbl_deep_extend("force", capabilities, {
        general = {
          positionEncodings = { "utf-8" },
        },
      }),
      settings = {
        basedpyright = {
          analysis = {
            typeCheckingMode = "standard",   -- или "basic" / "strict"
          },
        },
      },
    })

    -- Ruff (быстрый линтер + formatter)
    vim.lsp.config("ruff", {
      capabilities = capabilities,
      init_options = {
        settings = {
          -- Ruff автоматически подхватит ruff.toml из проекта или из ~/.config/nvim/ruff.toml
          -- Можно оставить пустым или добавить только специфические overrides
          configurationPreference = "filesystemFirst",
        },
      },
    })

    -- Автоматическое отключение hover у ruff (чтобы не конфликтовал с basedpyright)
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == "ruff" then
          client.server_capabilities.hoverProvider = false
        end

        -- LSP keymaps (можно вынести в отдельный autocmd позже)
        local map = vim.keymap.set
        local opts = { buffer = args.buf }

        map("n", "<leader>ld", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
        map("n", "<leader>lr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Go to references" }))
        map("n", "<leader>lh", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover docs" }))
        map("n", "<leader>ln", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
      end,
    })

    -- Включаем оба сервера
    vim.lsp.enable({ "basedpyright", "ruff" })
  end,
}
