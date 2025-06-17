-- Setup Lualine (Status Line)
require("lualine").setup({

    options = {
        theme = "rose-pine", -- Use any theme for the status line
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        icons_enabled = true,
    },
    sections = {
        lualine_a = { "mode" },                 -- Display mode (e.g., NORMAL, INSERT)
        lualine_b = { "branch" },               -- Git branch
        lualine_c = { "filename" },             -- Current file name
        lualine_x = { "encoding", "filetype" }, -- File encoding and type
        lualine_y = { "progress" },             -- Progress in the file
        lualine_z = { "location" },             -- Cursor position
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
})
