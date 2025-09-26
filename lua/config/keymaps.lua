-- Leader keys (must be before plugins and mappings)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- LazyVim completion engine to use.
vim.g.lazyvim_cmp = "auto"

-- File Explorer
vim.keymap.set("n", "<leader>cd", "<cmd>Ex<CR>", { desc = "File Explorer" })

-- Create a directory
vim.keymap.set("n", "<leader>md", function()
	vim.ui.input({ prompt = "Folder name: " }, function(folder)
		if folder and folder ~= "" then
			vim.fn.mkdir(folder, "p")
			print("✅ Created folder: " .. folder)
		else
			print("⚠ No folder name given.")
		end
	end)
end, { desc = "Make directory" })

-- Create a new file
vim.keymap.set("n", "<leader>nf", function()
	vim.ui.input({ prompt = "New file name: " }, function(input)
		if input and input ~= "" then
			vim.cmd("edit " .. vim.fn.fnameescape(input))
			print("✅ Created file: " .. input)
		else
			print("⚠ No file name given.")
		end
	end)
end, { desc = "Create new file" })

-- Toggle spell checking
vim.keymap.set("n", "<leader>ts", function()
	vim.opt.spell = not vim.opt.spell:get()
	print("Spell check " .. (vim.opt.spell and "enabled" or "disabled"))
end, { desc = "Toggle Spell Check" })

-- Open terminal (bottom split)
vim.keymap.set("n", "<leader>ot", function()
	vim.cmd("botright split | resize 10 | terminal")
end, { desc = "Open terminal" })

-- Close terminal window
vim.keymap.set("n", "<leader>ct", "<cmd>close<CR>", { desc = "Close terminal" })

-- Escape terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Exit terminal mode" })

-- LSP hover
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { desc = "LSP Hover" })

-- Show current error
vim.keymap.set("n", "<leader>e", function()
	vim.diagnostic.open_float({ scope = "line" })
end, { desc = "Show line diagnostics" })

-- Go to next error
vim.keymap.set("n", "<leader>ne", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next error" })

-- Go to previous error
vim.keymap.set("n", "<leader>pe", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous error" })

--Zen mode
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "Toggle Zen Mode" })
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-w>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-s>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-a>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-d>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })
