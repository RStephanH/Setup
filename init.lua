vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
--rsh plugins
--
--python lsp
-- Import the lspconfig plugin
local nvim_lsp = require('lspconfig')

-- Set up pyright for Python (and Django)
nvim_lsp.pyright.setup{
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "off"  -- You can adjust this based on your preference
      }
    }
  }
}

--c/c++ lsp 
-- Import the lspconfig plugin
--local nvim_lsp = require('lspconfig')

-- Set up pyright for Python
nvim_lsp.pyright.setup{}

-- Set up clangd for C and C++
nvim_lsp.clangd.setup{}

--html and css
-- Import the lspconfig plugin
--local nvim_lsp = require('lspconfig')

-- Set up the HTML language server
nvim_lsp.html.setup{
  cmd = { "html-languageserver", "--stdio" },
  filetypes = { "html" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true
    }
  }
}

nvim_lsp.bashls.setup{}

