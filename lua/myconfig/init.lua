-- General Configuration

return function()
    require("myconfig.vim_config")
    require("myconfig.key_mappings")
    require("myconfig.tree")
    require("myconfig.treesitter")
    require("myconfig.lsp")
    require("myconfig.colorscheme")
    require("myconfig.status_line")
end
