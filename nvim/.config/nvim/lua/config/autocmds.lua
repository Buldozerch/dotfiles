-- удалить [No Name] буфер когда открывается реальный файл
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local bufs = vim.api.nvim_list_bufs()
    for _, buf in ipairs(bufs) do
      local name = vim.api.nvim_buf_get_name(buf)
      local loaded = vim.api.nvim_buf_is_loaded(buf)
      local lines = vim.api.nvim_buf_line_count(buf)
      if loaded and name == "" and lines == 1 then
        local line = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1]
        if line == "" then
          vim.schedule(function()
            pcall(vim.cmd, "Bdelete " .. buf)
          end)
        end
      end
    end
  end,
})
