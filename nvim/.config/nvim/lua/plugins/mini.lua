local function setup()
  require("mini.comment").setup()
  require("mini.pairs").setup()
  require("mini.ai").setup()

  require("mini.surround").setup({
    mappings = {
      add = "gsa",
      delete = "gsd",
      replace = "gsr",
      find = "gsf",
      find_left = "gsF",
      highlight = "gsh",
      update_n_lines = "gsn",
    },
    silent = false,
  })

  require("mini.indentscope").setup({
    symbol = "▎",
  })

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

  require("mini.notify").setup({
    lsp_progress = {
      enable = false,
    },
  })
  vim.notify = require("mini.notify").make_notify()

  require("mini.cursorword").setup()
  require("mini.bracketed").setup()

  local starter = require("mini.starter")
  starter.setup({
    autoopen = true,
    evaluate_single = true,
    header = table.concat({
      "",
      " _   _ __     ___ __  __ ",
      "| \\ | |\\ \\   / / |  \\/  |",
      "|  \\| | \\ \\ / /| | |\\/| |",
      "| |\\  |  \\ V / | | |  | |",
      "|_| \\_|   \\_/  |_|_|  |_|",
      "",
      "BULDOZER",
      "there is nothing you cannot do",
      "",
    }, "\n"),
    footer = function()
      return os.date("%d.%m.%Y %H:%M")
    end,
    items = {
      { name = "Find file", action = "Telescope find_files", section = "Search" },
      { name = "Live grep", action = "Telescope live_grep", section = "Search" },
      { name = "Recent files", action = "Telescope oldfiles", section = "Search" },
      {
        name = "Harpoon menu",
        action = function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        section = "Session",
      },
      {
        name = "New file",
        action = function()
          vim.cmd("ene")
          vim.cmd("startinsert")
        end,
        section = "Session",
      },
      { name = "Quit", action = "qa", section = "Session" },
      starter.sections.recent_files(7, true, false),
    },
    content_hooks = {
      starter.gen_hook.adding_bullet("  "),
      starter.gen_hook.indexing("all", { "Builtin actions" }),
      starter.gen_hook.padding(2, 1),
    },
  })

  vim.opt.shortmess:append("I")

  vim.schedule(function()
    if #vim.api.nvim_list_uis() == 0 then
      return
    end

    local buf = vim.api.nvim_get_current_buf()
    local no_args = vim.fn.argc() == 0
    local empty_name = vim.api.nvim_buf_get_name(buf) == ""
    local normal_buf = vim.bo[buf].buftype == ""
    local one_line = vim.api.nvim_buf_line_count(buf) == 1
    local first = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1] or ""

    if no_args and empty_name and normal_buf and one_line and first == "" then
      starter.open()
    end
  end)
end

return { setup = setup }
