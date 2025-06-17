-- File tree setup (nvim-tree)
require("nvim-tree").setup({
    view = {
        width = 30,    -- Set the width of the file tree
        side = "left", -- Show the file tree on the left
    },
    filters = {
        dotfiles = false, -- Show hidden files (dotfiles)
    },
    git = {
        enable = true, -- Show git status icons
    },
})
