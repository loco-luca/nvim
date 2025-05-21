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
  for _, plugin in ipairs(require("myconfig.plugins")) do
    use(plugin) 
  end
end)



