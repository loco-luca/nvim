function colourScheme(colour)
    colour = colour or "rose-pine"
    -- try catch for colourscheme
    local ok, err = pcall(function()
        vim.cmd.colorscheme(colour)
    end)

    if not ok then
        vim.notify("Colour scheme '" .. colour .. "' not found", vim.log.levels.ERROR)
        return
    end

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

colourScheme("rose-pine")
