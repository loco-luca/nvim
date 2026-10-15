-- vim options

vim.opt.number = true
vim.opt.wrap = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.termguicolors = true
vim.opt.backup = false -- Don't create backup files
vim.opt.writebackup = false -- Don't create backup before writing
vim.opt.swapfile = false
vim.opt.updatetime = 300
vim.opt.clipboard = "unnamedplus"
vim.g.deprecation_warnings = false
vim.diagnostic.config({
	update_in_insert = true, -- Show errors live while typing
})
-- Enable syntax and filetype detection
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")
vim.cmd("set completeopt+=noselect")

-- Block arrow keys in Normal, Insert, and Visual modes
local modes = { "n", "i", "v" }
local arrows = { "<Up>", "<Down>", "<Left>", "<Right>" }

for _, mode in ipairs(modes) do
	for _, arrow in ipairs(arrows) do
		vim.keymap.set(mode, arrow, "<nop>", { silent = true })
	end
end
