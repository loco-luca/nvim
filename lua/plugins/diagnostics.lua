-- diagnostics

-- Open floating diagnostic window
vim.keymap.set("n", "<leader>dw", vim.diagnostic.open_float)

-- Go to next diagnostic
vim.keymap.set("n", "<leader>pe", vim.diagnostic.goto_prev)

-- Go to previous diagnostic
vim.keymap.set("n", "<leader>ne", vim.diagnostic.goto_next)
