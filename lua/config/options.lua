-- vim options

vim.opt.number = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.termguicolors = true
vim.opt.backup = false      -- Don't create backup files
vim.opt.writebackup = false -- Don't create backup before writing
vim.opt.swapfile = false
vim.opt.updatetime = 300
vim.opt.clipboard = "unnamedplus"

-- Folding with Treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldcolumn = "1" -- show fold column
vim.opt.foldlevel = 99   -- open all folds initially
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.opt.fillchars = {
	eob = " ", -- hide ~ at end of buffer
	fold = " ", -- folded line
	foldopen = "", -- open fold icon  foldsep = " ,  -- separator  foldclose = "", -- closed fold ic    foldinner =  ",  -- inside fold lines
}
