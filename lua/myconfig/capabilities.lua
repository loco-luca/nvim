
-- capabilities

local M = {}

-- Export enhanced LSP capabilities (e.g. for nvim-cmp completion)
M.capabilities = require("cmp_nvim_lsp").default_capabilities()

return M
