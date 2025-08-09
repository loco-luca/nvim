return {
    "nvim-tree/nvim-tree.lua", -- correct repo name
    config = function()
        require("nvim-tree").setup({
            view = {
                width = 30,
                side = "left",
            },
            filters = {
                dotfiles = false, -- Show hidden dotfiles
            },
            git = {
                enable = true,  -- Show git status icons
                ignore = false, -- Do not hide gitignored files
            },
            update_focused_file = {
                enable = true,
                update_cwd = true,
            },
        })

        -- Keybinding to toggle NvimTree
        vim.keymap.set("n", "<leader>b", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
    end
}
