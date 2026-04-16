-- В файле, где у тебя основной конфиг (например, lua/config/plugins.lua)

local plugins = {
  -- File explorer
  { src = "https://github.com/nvim-tree/nvim-tree.lua.git",     config = "nvim-tree" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons.git" },
  { src = "https://github.com/nvim-mini/mini.nvim.git",         config = "mini" },
  { src = "https://github.com/nvim-telescope/telescope.nvim.git", config = "telescope" },
  { src = "https://github.com/nvim-lua/plenary.nvim.git" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter.git", config = "treesitter" },
  { src = "https://github.com/folke/which-key.nvim.git",         config = "which-key" },
  { src = "https://github.com/neovim/nvim-lspconfig.git",         config = "lsp" },
  { src = "https://github.com/mason-org/mason.nvim.git" },
  { src = "https://github.com/saghen/blink.cmp.git",              version = "1.*", config = "blink" },
  { src = "https://github.com/L3MON4D3/LuaSnip.git" },
  { src = "https://github.com/wakatime/vim-wakatime.git" },
  { src = "https://github.com/folke/tokyonight.nvim.git" },
  { src = "https://github.com/lewis6991/gitsigns.nvim.git", config="gitsigns" },
  { src = "https://github.com/folke/noice.nvim.git", config = "noice" },
  { src = "https://github.com/MunifTanjim/nui.nvim.git" },

  { src = "https://github.com/folke/flash.nvim.git",         config = "flash" },
  {
      src = "https://github.com/ThePrimeagen/harpoon.git",
      branch = "harpoon2",                    -- ← обязательно!
      config = "harpoon",
    },

  -- остальные плагины...
}

-- Формируем specs для vim.pack (сохраняем branch/version и т.д.)
local specs = {}
for _, p in ipairs(plugins) do
  local spec = { src = p.src }

  if p.version then
    spec.version = p.version
  end

  if p.branch then
    spec.branch = p.branch
  end

  if p.build then
    spec.build = p.build
  end

  table.insert(specs, spec)
end


-- === Загрузка конфигов только для включённых плагинов ===
local function load_plugin_configs()
  local enabled = {}
  for _, p in ipairs(plugins) do
    if p.config then
      enabled[p.config] = true
    end
  end

  local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
  local files = vim.fn.glob(plugin_dir .. "/*.lua", false, true)

  for _, file in ipairs(files) do
    local name = vim.fn.fnamemodify(file, ":t:r")   -- "nvim-tree", "mini" и т.д.

    if enabled[name] then
      local ok, mod = pcall(require, "plugins." .. name)
      if ok and type(mod.setup) == "function" then
        vim.schedule(mod.setup)
      end
    end
  end
end

vim.pack.add(specs)
load_plugin_configs()
