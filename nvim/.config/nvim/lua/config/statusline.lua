local M = {}

local function mode_label()
  local mode = vim.api.nvim_get_mode().mode
  local labels = {
    n = " NORMAL",
    i = " INSERT",
    v = " VISUAL",
    V = " V-LINE",
    ["\22"] = " V-BLOCK",
    c = " COMMAND",
    s = " SELECT",
    S = " S-LINE",
    ["\19"] = " S-BLOCK",
    R = " REPLACE",
    r = " REPLACE",
    ["!"] = " SHELL",
    t = " TERMINAL",
  }
  return labels[mode] or (" " .. mode)
end

local function git_branch(bufnr)
  local head = vim.b[bufnr].gitsigns_head
  if head and head ~= "" then
    return "   " .. head
  end

  local status = vim.b[bufnr].gitsigns_status_dict
  if type(status) == "table" and status.head and status.head ~= "" then
    return "   " .. status.head
  end

  return ""
end

local function file_type(bufnr)
  local ft = vim.bo[bufnr].filetype
  if ft == "" then
    return " 󰈙"
  end
  return " " .. ft
end

local function file_size(bufnr)
  local name = vim.api.nvim_buf_get_name(bufnr)
  if name == "" then
    return ""
  end

  local size = vim.fn.getfsize(name)
  if size < 0 then
    return ""
  end
  if size < 1024 then
    return string.format(" %dB", size)
  end
  if size < 1024 * 1024 then
    return string.format(" %.1fK", size / 1024)
  end
  return string.format(" %.1fM", size / 1024 / 1024)
end

local function diagnostics(bufnr)
  local diags = vim.diagnostic.count(bufnr)
  local errs = diags[vim.diagnostic.severity.ERROR] or 0
  local warns = diags[vim.diagnostic.severity.WARN] or 0
  if errs == 0 and warns == 0 then
    return ""
  end
  return string.format("  󰅚 %d 󰀪 %d", errs, warns)
end

local function progress(winid, bufnr)
  local total = vim.api.nvim_buf_line_count(bufnr)
  if total <= 0 then
    return ""
  end
  local current = vim.api.nvim_win_get_cursor(winid)[1]
  return string.format(" %d%%%%", math.floor(current / total * 100))
end

function M.render()
  local winid = vim.g.statusline_winid or vim.api.nvim_get_current_win()
  local bufnr = vim.api.nvim_win_get_buf(winid)
  local active = winid == vim.api.nvim_get_current_win()

  if not active then
    return table.concat({
      "  %f %h%m%r",
      "%=",
      "%l:%c  ",
    })
  end

  return table.concat({
    "%#StatusLineMode#",
    mode_label(),
    "%#StatusLine#",
    "   %f %h%m%r",
    git_branch(bufnr),
    " ",
    file_type(bufnr),
    file_size(bufnr),
    diagnostics(bufnr),
    "%=",
    progress(winid, bufnr),
    "   %l:%c  ",
  })
end

vim.api.nvim_set_hl(0, "StatusLineMode", { fg = "#89b4fa", bold = true })
vim.o.statusline = "%!v:lua.require('config.statusline').render()"

return M
