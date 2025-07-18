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

-- === Diagnostics ===
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Diagnostic open float window ' })
vim.keymap.set('n', '<leader>ne', vim.diagnostic.goto_next, { desc = 'Diagnostic go to the next error' })
vim.keymap.set('n', '<leader>pe', vim.diagnostic.goto_prev, { desc = 'Diagnostic go to the previous error' })

-- === DAP (Debug Adapter Protocol) ===
local dap = require('dap')
vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: Continue" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })
vim.keymap.set("n", "<Leader>bp", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
vim.keymap.set("n", "<Leader>BP", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP: Set Conditional Breakpoint" })
vim.keymap.set("n", "<Leader>lp", function()
    dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "DAP: Set Log Point" })
vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })
vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "DAP: Run Last" })
