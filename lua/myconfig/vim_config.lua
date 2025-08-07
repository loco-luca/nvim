
-- ========================
-- General Vim Configurations
-- ========================

-- Set leader keys BEFORE using them
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd("syntax on")
vim.opt.termguicolors = true

-- Debug leader termcode (optional)
-- local leader = vim.g.mapleader or "\\"
-- local termcode = vim.api.nvim_replace_termcodes(leader, true, true, true)
-- print("Leader termcode:", termcode)

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

-- Disable unnecessary providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Append FZF to runtime path if directory exists (adjust path for your system)
local fzf_path = "/opt/homebrew/opt/fzf"
if vim.fn.isdirectory(fzf_path) == 1 then
  vim.opt.rtp:append(fzf_path)
end

-- ========================
-- Autoformat Python files on save synchronously
-- ========================
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    if vim.lsp.buf.format then
      -- Protected call to avoid errors on format failure
      local ok, err = pcall(vim.lsp.buf.format, { async = false })
      if not ok then
        vim.notify("Format error: " .. err, vim.log.levels.WARN)
      end
    end
  end,
})

-- ========================
-- Keymaps
-- ========================

-- Create a directory
vim.keymap.set("n", "<leader>md", function()
  local folder = vim.fn.input("Folder name: ")
  if folder ~= "" then
    vim.fn.mkdir(folder, "p") -- "p" creates parent directories if needed
    print("✅ Created folder: " .. folder)
  else
    print("⚠ No folder name given.")
  end
end, { desc = "Make directory" })

-- Create a new file
vim.keymap.set("n", "<leader>nf", function()
  vim.cmd("enew") -- Open new empty buffer
  vim.ui.input({ prompt = "New file name: " }, function(input)
    if input and input ~= "" then
      vim.cmd("write " .. vim.fn.fnameescape(input)) -- Save buffer
      print("✅ Created file: " .. input)
    else
      print("⚠ No file name given.")
    end
  end)
end, { desc = "Create new file" })

-- Optional: Toggle spell checking
vim.keymap.set("n", "<leader>ts", function()
  vim.opt.spell = not vim.opt.spell:get()
  print("Spell check " .. (vim.opt.spell:get() and "enabled" or "disabled"))
end, { desc = "Toggle Spell Check" })

-- ========================
-- Enable LSP file watching globally (using watchman)
-- ========================
local has_watchman, watchman_watch = pcall(require, "vim.lsp._watchfiles")
if has_watchman and watchman_watch and watchman_watch.watchman_watch then
  require("vim.lsp._watchfiles")._watchfunc = watchman_watch.watchman_watch
end

-- ========================
-- Language-specific Auto Commands
-- ========================

-- Python
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
    vim.opt_local.smartindent = true
  end,
})

-- C / C++
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = false -- Use tabs
    vim.opt_local.smartindent = true
    vim.opt_local.cindent = true
  end,
})

-- TypeScript / JavaScript / React
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


