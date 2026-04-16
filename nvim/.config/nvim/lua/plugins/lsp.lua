local function setup()
  local capabilities = require("blink.cmp").get_lsp_capabilities()

  require("mason").setup({})

  vim.diagnostic.config({
    virtual_text = {
      prefix = "●",
      spacing = 2,
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      border = "rounded",
      source = "if_many",
      header = "",
      prefix = "",
      focusable = false,
    },
  })

  local orig_open_float = vim.lsp.util.open_floating_preview
  vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "rounded"
    return orig_open_float(contents, syntax, opts, ...)
  end

  local function lsp_opts(bufnr, desc)
    return { buffer = bufnr, silent = true, desc = desc }
  end

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
    callback = function(args)
      local bufnr = args.buf

      vim.keymap.set("n", "K", vim.lsp.buf.hover, lsp_opts(bufnr, "LSP hover"))
      vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, lsp_opts(bufnr, "LSP definition"))
      vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, lsp_opts(bufnr, "LSP declaration"))
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, lsp_opts(bufnr, "LSP references"))
      vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, lsp_opts(bufnr, "LSP implementation"))
      vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, lsp_opts(bufnr, "LSP type definition"))
      vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, lsp_opts(bufnr, "LSP rename"))
      vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, lsp_opts(bufnr, "LSP code action"))
      vim.keymap.set("n", "<leader>ls", vim.lsp.buf.document_symbol, lsp_opts(bufnr, "LSP document symbols"))
      vim.keymap.set("n", "<leader>lS", vim.lsp.buf.workspace_symbol, lsp_opts(bufnr, "LSP workspace symbols"))
      vim.keymap.set("n", "<leader>lf", function()
        vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 2000 })
      end, lsp_opts(bufnr, "LSP format buffer"))
    end,
  })

  vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        telemetry = {
          enable = false,
        },
      },
    },
  })

  vim.lsp.config("pyright", { capabilities = capabilities })

  vim.lsp.config("rust_analyzer", { capabilities = capabilities })
  vim.lsp.config("ts_ls", { capabilities = capabilities })

  vim.lsp.enable({ "lua_ls", "pyright", "rust_analyzer", "ts_ls" })
end

return { setup = setup }
