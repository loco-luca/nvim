-- Setup Lualine (Status Line)

local ok, lualine = pcall(require, "lualine")
if not ok then return end

-- Optional: GitHub Copilot status in the statusline
local function copilot_status()
    local ok, api = pcall(require, "copilot.api")
    if not ok then return "" end

    local status = api.status.data
    if status and status.message then
        return " " .. status.message
    end
    return ""
end

-- Detect current colorscheme or fallback
local theme = vim.g.colors_name or "auto"

lualine.setup({
    options = {
        theme = theme,
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = {
            { "diagnostics", sources = { "nvim_lsp" } },
            copilot_status, -- You can remove this if not using Copilot
            "encoding",
            "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})
