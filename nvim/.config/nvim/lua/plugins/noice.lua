local function setup()
  require("noice").setup({
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      format = {
        cmdline = { icon = "" },
        search_down = { icon = " " },
        search_up = { icon = " " },
      },
    },
    messages = {
      enabled = true,
      view = "notify",
      view_error = "notify",
      view_warn = "notify",
      view_history = "messages",
      view_search = "virtualtext",
    },
    popupmenu = {
      enabled = true,
      backend = "nui",
    },
    notify = {
      enabled = false,
    },
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "written" },
            { find = "%d+ lines yanked" },
            { find = "%d+ more lines" },
          },
        },
        opts = { skip = true },
      },
    },
  })

  vim.keymap.set("n", "<leader>nh", "<cmd>Noice history<CR>", { desc = "Noice: message history", silent = true })
  vim.keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<CR>", { desc = "Noice: dismiss messages", silent = true })
end

return { setup = setup }
