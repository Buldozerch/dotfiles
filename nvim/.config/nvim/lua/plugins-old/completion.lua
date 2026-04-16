return {
  "saghen/blink.cmp",
  version = "^1",
  build = "cargo build --release",
  opts = {
    keymap = {
      preset = "none",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
    },
    sources = {
      default = { "lsp", "path", "buffer" },
    },
    completion = {
      documentation = {
        auto_show = true,        -- документация сбоку
        auto_show_delay_ms = 100,
      },
      menu = {
        draw = {
          columns = {
            { "kind_icon" },                  -- иконка типа
            { "label", "label_description", gap = 1 }, -- название + описание
            { "kind", "source_name", gap = 1 },        -- тип + источник
          },
        },
      },
    },
    appearance = {
      nerd_font_variant = "mono", -- иконки из Nerd Fonts
    },
  },
}
