-- Description: This script sets up a color scheme for Neovim with a fallback mechanism.
function colorScheme(color)
    color = color or "rose-pine"
    local ok, err = pcall(function()
        vim.cmd.colorscheme(color)
    end)

    if not ok then
        vim.notify("Color scheme '" .. color .. "' not found", vim.log.levels.ERROR)
        return
    end

    -- Set transparent background for Normal and NormalFloat
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- Call the function with default or specific scheme
colorScheme("rose-pine")
