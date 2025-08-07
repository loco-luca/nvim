-- General Configuration
-- Plugins
require("myconfig.plugins")

-- Theme
require("myconfig.colorscheme")

-- Vim UI/Options
require("myconfig.vim_config")

-- Telescope & UI Tools
require("myconfig.telescope")
require("myconfig.status_line")
require("myconfig.tree") -- Add this if you want file explorer

-- LSP Core
require("myconfig.capabilities")
require("myconfig.cmp")
require("myconfig.on_attach")
require("myconfig.diagnostic")
require("myconfig.lsp")

-- Optional: null-ls setup
require("myconfig.null_ls")

-- GitHub Copilot
require("myconfig.copilot")

-- Syntax Highlighting
require("myconfig.treesitter")
require("myconfig.tree")
