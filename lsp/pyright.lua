return {
        -- Command and arguments to start the server.
        cmd = { "pyright-langserver", "--stdio" },

        -- Filetypes to automatically attach to.
        filetypes = { "python" },

        -- Sets the "root directory" to the parent directory of the file in the
        -- current buffer that contains either a "pyproject.toml", "setup.py",
        -- or ".git" file.
        root_markers = { { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt" }, ".git" },

        -- Specific settings to send to the server.
        settings = {
                python = {
                        analysis = {
                                autoSearchPaths = true,
                                useLibraryCodeForTypes = true,
                                diagnosticMode = "workspace",
                                typeCheckingMode = "basic", -- or "strict" for stricter checks
                        },
                },
        },
}
