-- Keybinding configuration

local builtin = require("telescope.builtin")

-- NvimTree
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Format buffer
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true, desc = "Format buffer" })

-- Telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Telescope git files" })
vim.keymap.set("n", "<leader>nf", function()
    vim.cmd("enew")
    vim.ui.input({ prompt = "New file name: " }, function(input)
        if input and input ~= "" then
            vim.cmd("write " .. input)
        end
    end)
end, { desc = "Create new file" })

-- Diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set("n", "<leader>ne", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>pe", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })

-- Copilot
vim.keymap.set("n", "<leader>cc", ":Copilot chat<CR>", { desc = "Copilot Chat", silent = true, noremap = true })
vim.keymap.set("n", "<leader>cp", ":Copilot panel<CR>", { desc = "Copilot Panel", silent = true, noremap = true })
vim.keymap.set("n", "<leader>ci", ":Copilot info<CR>", { desc = "Copilot Info", silent = true, noremap = true })
vim.keymap.set("n", "<leader>cs", ":Copilot status<CR>", { desc = "Copilot Status", silent = true, noremap = true })
vim.keymap.set("n", "<leader>ct", ":Copilot toggle<CR>", { desc = "Copilot Toggle", silent = true, noremap = true })
vim.keymap.set("n", "<leader>ca", ":Copilot accept<CR>", { desc = "Copilot Accept", silent = true, noremap = true })
