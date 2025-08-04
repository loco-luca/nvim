-- General Vim Configurations
vim.cmd("syntax on")
vim.opt.termguicolors = true
vim.g.mapleader = " "

-- Basic editor settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.wrap = false
vim.opt.spell = true
vim.opt.undofile = true
vim.opt.swapfile = false

-- Disable unnecessary providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Append FZF to runtime path (adjust the path if necessary)
vim.opt.rtp:append({ "/opt/homebrew/opt/fzf" })

-- Autoformat Python files on save synchronously
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,

})

-- Format buffer
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true, desc = "Format buffer" })



-- Keymap to create a new file: opens a new buffer, then prompts for a file name and saves it
vim.keymap.set("n", "<leader>nf", function()
    vim.cmd("enew") -- Open a new empty buffer
    vim.ui.input({ prompt = "New file name: " }, function(input)
        if input and input ~= "" then
            -- Write the buffer to the given file name, escaping it safely
            vim.cmd("write " .. vim.fn.fnameescape(input))
        end
    end)
end, { desc = "Create new file" })


-- Enable LSP file watching globally (using watchman)
require("vim.lsp._watchfiles")._watchfunc = require("vim.lsp._watchfiles").watchman_watch

-- Language-specific Auto Commands

-- Python indentation and tabs settings
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
        vim.opt_local.smartindent = true
    end,
})

-- C / C++ indentation and tabs settings
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.expandtab = false -- Use tabs instead of spaces
        vim.opt_local.smartindent = true
        vim.opt_local.cindent = true
    end,
})

-- TypeScript / JavaScript / React indentation and tabs settings
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
        vim.opt_local.smartindent = true
    end,
})

-- Enable spell checking for writing-related file types
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "text", "gitcommit" },
    callback = function()
        vim.opt_local.spell = true
    end,
})
