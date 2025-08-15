-- Basic editor settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.wrap = false
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.winborder = "rounded"

-- -- deactiving arrows keys
-- local modes = { "n", "i", "v" }
-- local arrows = { "<Up>", "<Down>", "<Left>", "<Right>" }
--
-- for _, mode in ipairs(modes) do
--         for _, key in ipairs(arrows) do
--                 vim.keymap.set(mode, key, "<NOP>", { noremap = true, silent = true })
--         end
-- end
