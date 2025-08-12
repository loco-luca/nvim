-- Set leader keys BEFORE using them
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- Create a directory
vim.keymap.set("n", "<leader>md", function()
        vim.cmd("!mkdir")
        local folder = vim.ui.input("Folder name: ")
        if folder ~= "" then
                vim.fn.mkdir(folder, "p") -- "p" creates parent directories if needed
                print("✅ Created folder: " .. folder)
        else
                print("⚠ No folder name given.")
        end
end, { desc = "Make directory" })

-- Create a new file
vim.keymap.set("n", "<leader>nf", function()
        vim.cmd("enew") -- Open new empty buffer
        vim.ui.input({ prompt = "New file name: " }, function(input)
                if input and input ~= "" then
                        vim.cmd("write " .. vim.fn.fnameescape(input)) -- Save buffer
                        print("✅ Created file: " .. input)
                else
                        print("⚠ No file name given.")
                end
        end)
end, { desc = "Create new file" })

-- Optional: Toggle spell checking
vim.keymap.set("n", "<leader>ts", function()
        vim.opt.spell = not vim.opt.spell:get()
        print("Spell check " .. (vim.opt.spell:get() and "enabled" or "disabled"))
end, { desc = "Toggle Spell Check" })

-- open terminal
vim.keymap.set("n", "<leader>ot", function()
        vim.cmd.vnew()
        vim.cmd.term()
        vim.cmd.wincmd("J")
        vim.api.nvim_win_set_height(0, 5)
end, { desc = "Open terminal" })

-- close terminal
vim.keymap.set("n", "<leader>ct", function()
        vim.cmd("close")
end, { desc = "Close terminal" })

-- to escape terminal
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
