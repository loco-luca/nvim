-- 
--[[
This for you not needed to 
have to download every single repo
individually  in future. 
]]
return {
  -- Plugin manager
  "wbthomason/packer.nvim",

  -- LSP + Autocomplete
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "saadparwaiz1/cmp_luasnip",
  "L3MON4D3/LuaSnip",

  -- Theme
  "Mofiqul/vscode.nvim",

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- Icons
  "nvim-tree/nvim-web-devicons",
}
