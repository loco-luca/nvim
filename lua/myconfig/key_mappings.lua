-- Keybinding configuration

-- Keybinding to toggle NvimTree
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- === Formatting ===
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
vim.keymap.set("n", "<leader>nf", function()
    vim.cmd("enew") -- Create new buffer
    vim.ui.input({ prompt = "New file name: " }, function(input)
        if input ~= nil and input ~= "" then
            vim.cmd("write " .. input)
        end
    end)
end, { desc = "Create new file" })

-- === Diagnostics for error highlighting ===
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Diagnostic open float window ' })
vim.keymap.set('n', '<leader>ne', vim.diagnostic.goto_next, { desc = 'Diagnostic go to the next error' })
vim.keymap.set('n', '<leader>pe', vim.diagnostic.goto_prev, { desc = 'Diagnostic go to the previous error' })


-- === Copilot keybindings ===
vim.keymap.set('n', '<leader>cc', ':Copilot chat<CR>', { noremap = true, silent = true, desc = 'Open Copilot chat' })
vim.keymap.set('n', '<leader>cp', ':Copilot panel<CR>', { noremap = true, silent = true, desc = 'Open Copilot panel' })
vim.keymap.set('n', '<leader>ci', ':Copilot info<CR>', { noremap = true, silent = true, desc = 'Show Copilot info' })
vim.keymap.set('n', '<leader>cs', ':Copilot status<CR>', { noremap = true, silent = true, desc = 'Show Copilot status' })
vim.keymap.set('n', '<leader>ct', ':Copilot toggle<CR>', { noremap = true, silent = true, desc = 'Toggle Copilot' })
vim.keymap.set('n', '<leader>ca', ':Copilot accept<CR>',
    { noremap = true, silent = true, desc = 'Accept Copilot suggestion' })
