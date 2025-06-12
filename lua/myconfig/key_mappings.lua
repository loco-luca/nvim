-- Keybinding configuration

-- Keybinding to toggle NvimTree
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true, buffer = bufnr })

-- Telescope commands
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Telescope search  through git files' })
-- Diagnostic Commands
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Diagnostic open float window ' })
vim.keymap.set('n', '<leader>ne', vim.diagnostic.goto_next, { desc = 'Diagnostic go to the next error' })
vim.keymap.set('n', '<leader>pe', vim.diagnostic.goto_prev, { desc = 'Diagnostic go to the previous error' })
