-- LSP and Autocompletion Configuration


-- Lua LSP
vim.lsp.enable("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
    },
  },
})

-- Python LSP
vim.lsp.enable("pyright", {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = {
    { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt" },
    ".git",
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
        typeCheckingMode = "basic",
      },
    },
  },
})

-- C/C++ LSP
vim.lsp.enable("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=never",
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_markers = { { "compile_commands.json", "compile_flags.txt" }, ".git" },
  init_options = {
    clangdFileStatus = true,
  },
})

-- Dart/Flutter LSP
vim.lsp.enable("dartls", {
  cmd = { "flutter", "language-server", "--protocol=lsp" },
  filetypes = { "dart" },
  root_markers = { "pubspec.yaml", ".git" },
  init_options = {
    closingLabels = true,
    outline = true,
    flutterOutline = true,
  },
})

-- Diagnostics config
vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  },
})

-- Unified LspAttach autocmd
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local bufnr = ev.buf

    -- Format on save
    local fmt = require("myconfig.on_attach")
    fmt.format_on_save(client, bufnr)

    -- Completion
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
      vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })

      vim.keymap.set("i", "<C-Space>", function()
        vim.lsp.completion.get()
      end, { buffer = bufnr })
    end
  end,
})
