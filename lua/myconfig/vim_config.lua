-- General Vim Configurations

vim.cmd("syntax enable")
vim.o.termguicolors = true

-- Basic editor settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.clipboard = "unnamedplus"

-- Load Packer and define plugins
vim.cmd([[packadd packer.nvim]])


require("packer").startup(function(use)
  use "wbthomason/packer.nvim" -- Packer manages itself

  -- Autocompletion and LSP plugins
  use "neovim/nvim-lspconfig" -- Collection of configurations for built-in LSP client
  use "hrsh7th/nvim-cmp" -- Autocompletion plugin
  use "hrsh7th/cmp-nvim-lsp" -- LSP source for nvim-cmp
  use "hrsh7th/cmp-buffer" -- Buffer source for nvim-cmp
  use "hrsh7th/cmp-path" -- Path source for nvim-cmp
  use "hrsh7th/cmp-cmdline" -- Cmdline source for nvim-cmp
  use "saadparwaiz1/cmp_luasnip" -- Snippets source for nvim-cmp
  use "L3MON4D3/LuaSnip" -- Snippet engine
  use "Mofiqul/vscode.nvim" -- VSCode theme plugin

  -- Status line plugin
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
  }

  -- Treesitter for better syntax highlighting and parsing
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- File explorer with Material Icons
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- Material Icons
    },
  }

  -- Material Design Icons
  use "nvim-tree/nvim-web-devicons"
end)



