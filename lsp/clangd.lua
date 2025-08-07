return {
        -- Command and arguments to start the server.
        cmd = { "clangd" },

        -- Filetypes to automatically attach to.
        filetypes = { "c", "cpp", "objc", "objcpp" },

        -- Sets the "root directory" based on presence of compile_commands.json,
        -- compile_flags.txt, or a .git directory.
        root_markers = { { "compile_commands.json", "compile_flags.txt" }, ".git" },

        -- Specific settings to send to the server.
        -- Clangd does not require a `settings` table like some other LSPs,
        -- but you can pass command-line flags through the `cmd` field.
        -- Here’s how you might do that:
        init_options = {
                clangdFileStatus = true, -- Provides info on active file parsing
        },
}
