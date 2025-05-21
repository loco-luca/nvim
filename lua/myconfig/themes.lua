-- Nvim UI 
-- Treesitter Configuration
require("nvim-treesitter.configs").setup({
  ensure_installed = { "python", "lua", "bash", "json", "yaml", "cpp"}, -- Add more languages if needed
  highlight = {
    enable = true, -- Enable syntax highlighting
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true, -- Enable indentation based on Treesitter
  },
})

-- File tree setup (nvim-tree)
require("nvim-tree").setup({
  view = {
    width = 30, -- Set the width of the file tree
    side = "left", -- Show the file tree on the left
  },
  filters = {
    dotfiles = false, -- Show hidden files (dotfiles)
  },
  git = {
    enable = true, -- Show git status icons
  },
})

-- Load and configure Material Design Icons
local status, web_devicons = pcall(require, "nvim-web-devicons")
if status then
  web_devicons.setup({
    default = true, -- Enable default icons for unsupported filetypes
    override = {
      py = {
        icon = "", -- Python icon
        color = "#3572A5",
        cterm_color = "61",
        name = "Python",
      },
      ["__pycache__"] = {
        icon = "", -- Folder icon
        color = "#6d8086",
        cterm_color = "245",
        name = "PyCache",
      },
    },
  })
else
  print("Failed to load nvim-web-devicons")
end

-- Apply the VSCode Theme
local theme_ok, _ = pcall(vim.cmd, "colorscheme vscode")
if not theme_ok then
  print("Failed to load colorscheme 'vscode'. Make sure the plugin is installed.")
end
vim.o.background = "dark" -- Set the theme to dark mode

-- Setup Lualine (Status Line)
require("lualine").setup({
  options = {
    theme = "vscode", -- Use the VSCode theme for the status line
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    icons_enabled = true,
  },
  sections = {
    lualine_a = { "mode" }, -- Display mode (e.g., NORMAL, INSERT)
    lualine_b = { "branch" }, -- Git branch
    lualine_c = { "filename" }, -- Current file name
    lualine_x = { "encoding", "filetype" }, -- File encoding and type
    lualine_y = { "progress" }, -- Progress in the file
    lualine_z = { "location" }, -- Cursor position
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