local function setup()
  local blink = require("blink.cmp")

  blink.setup({
    keymap = {
      preset = "none",
      ["<C-Space>"] = { "show", "hide" },
      ["<CR>"] = { "accept", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      menu = { auto_show = true },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
      },
    },
    sources = {
      default = { "lsp", "path", "buffer", "snippets" },
    },
    snippets = {
      expand = function(snippet)
        require("luasnip").lsp_expand(snippet)
      end,
    },
    fuzzy = {
      implementation = "lua",
    },
  })
end

return { setup = setup }
