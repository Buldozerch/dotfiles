local function setup()
  -- ==================== mini.comment ====================
  require("mini.comment").setup()

  -- ==================== mini.pairs ====================
  require("mini.pairs").setup()

  -- ==================== mini.ai ====================
  require("mini.ai").setup()

  -- ==================== mini.surround (nvim-surround замена) ====================
  require("mini.surround").setup({
    mappings = {
      add = "gsa",      -- ← изменили с <leader>sa на gsa (рекомендуется)
      delete = "gsd",
      replace = "gsr",
      find = "gsf",
      find_left = "gsF",
      highlight = "gsh",
      update_n_lines = "gsn",
    },
    silent = false,     -- показывать сообщения
  })

  -- ==================== mini.indentscope ====================
  require("mini.indentscope").setup({
    symbol = "▎",
  })

  -- ==================== mini.icons ====================
  require("mini.icons").setup()

  -- ==================== mini.hipatterns ====================
  local hipatterns = require("mini.hipatterns")
  hipatterns.setup({
    highlighters = {
      fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
      hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
      todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
      note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  })

  -- ==================== mini.notify ====================
  require("mini.notify").setup()
  vim.notify = require("mini.notify").make_notify()

  -- ==================== mini.cursorword ====================
  require("mini.cursorword").setup()

  -- ==================== mini.bracketed ====================
  require("mini.bracketed").setup()
end

return { setup = setup }
