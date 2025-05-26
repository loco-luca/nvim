-- General Vim Configurations
vim.cmd("syntax on")
vim.opt.termguicolors = true

-- Basic editor settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.wrap = false
vim.opt.spell = true

-- Language-specific Auto Commands

-- Python
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
    vim.opt_local.smartindent = true
  end,
})

-- C / C++
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = false -- Use tabs instead of spaces
    vim.opt_local.smartindent = true
    vim.opt_local.cindent = true
  end,
})

-- TypeScript / JavaScript / React
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
    vim.opt_local.smartindent = true
  end,
})

-- Load Packer and define plugins
vim.cmd([[packadd packer.nvim]])

require("packer").startup(function(use)
  for _, plugin in ipairs(require("myconfig.plugins")) do
    use(plugin)
  end
end)




