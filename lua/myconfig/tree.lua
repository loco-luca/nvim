-- File tree setup (nvim-tree)

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
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
