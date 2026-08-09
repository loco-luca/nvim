-- vim options

vim.opt.number = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.termguicolors = true
vim.opt.backup = false -- Don't create backup files
vim.opt.writebackup = false -- Don't create backup before writing
vim.opt.swapfile = false
vim.opt.updatetime = 300
vim.opt.clipboard = "unnamedplus"
-- Enable syntax and filetype detection
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")
vim.cmd("set completeopt+=noselect")
