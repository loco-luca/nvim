-- General Vim Configurations

vim.cmd("syntax on")
vim.opt.termguicolors = true

-- Basic editor settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cindent = true
vim.opt.mouse = "a"
vim.opt.wrap = false
vim.opt.spell = true

-- Load Packer and define plugins
vim.cmd([[packadd packer.nvim]])


require("packer").startup(function(use)
  for _, plugin in ipairs(require("myconfig.plugins")) do
    use(plugin)
  end
end)



