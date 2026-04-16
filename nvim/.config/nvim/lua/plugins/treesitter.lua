local function setup()
  local treesitter = require("nvim-treesitter")
  local config = require("nvim-treesitter.config")

  treesitter.setup({})

  local ensure_installed = {
    "lua",
    "rust",
    "python",
    "javascript",
    "typescript",
    "solidity",
    "vim",
    "vimdoc",
  }

  local installed = config.get_installed()
  local parsers_to_install = {}

  for _, parser in ipairs(ensure_installed) do
    if not vim.tbl_contains(installed, parser) then
      table.insert(parsers_to_install, parser)
    end
  end

  if #parsers_to_install > 0 then
    pcall(treesitter.install, parsers_to_install)
  end

  local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })

  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    callback = function(args)
      local ok_lang, lang = pcall(vim.treesitter.language.get_lang, args.match)
      if not ok_lang or not lang then
        return
      end

      if vim.list_contains(treesitter.get_installed(), lang) then
        pcall(vim.treesitter.start, args.buf)
      end
    end,
  })
end

return { setup = setup }
