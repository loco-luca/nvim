-- General Vim Configurations
-- Set leader keys BEFORE using them
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd("syntax on")
vim.opt.termguicolors = true

-- Now get the actual leader key character (space)
local leader = vim.g.mapleader or "\\"
-- Convert it to terminal codes if needed
local termcode = vim.api.nvim_replace_termcodes(leader, true, true, true)
print("Leader termcode:", termcode) -- Should print a space or something valid

-- Basic editor settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.wrap = false
vim.opt.spell = true
vim.opt.undofile = true
vim.opt.swapfile = false

-- Disable unnecessary providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Append FZF to runtime path (adjust path for your system)
vim.opt.rtp:append({ "/opt/homebrew/opt/fzf" })

-- Autoformat Python files on save synchronously
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.py",
	callback = function()
		if vim.lsp.buf.format then
			vim.lsp.buf.format({ async = false })
		end
	end,
})

--- TEST

vim.keymap.set("n", "<leader>f", function()
	print("You pressed leader+f alone")
end, { desc = "Test leader f alone" })

-- Keymap to create a new file: open new buffer, then prompt for file name and save it
vim.keymap.set("n", "<leader>nf", function()
	vim.cmd("enew") -- Open new empty buffer
	vim.ui.input({ prompt = "New file name: " }, function(input)
		if input and input ~= "" then
			-- Save buffer to input file safely
			vim.cmd("write " .. vim.fn.fnameescape(input))
		end
	end)
end, { desc = "Create new file" })

-- Enable LSP file watching globally (using watchman)
-- Only do this if watchman is installed
local has_watchman, watchman_watch = pcall(require, "vim.lsp._watchfiles")
if has_watchman and watchman_watch and watchman_watch.watchman_watch then
	require("vim.lsp._watchfiles")._watchfunc = watchman_watch.watchman_watch
end

-- Language-specific Auto Commands

-- Python indentation and tabs settings
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
		vim.opt_local.smartindent = true
	end,
})

-- C / C++ indentation and tabs settings
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

-- TypeScript / JavaScript / React indentation and tabs settings
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
		vim.opt_local.smartindent = true
	end,
})

-- Enable spell checking for writing-related file types
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.spell = true
	end,
})
