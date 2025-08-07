return {
        -- Command and arguments to start the server.
        cmd = { "flutter", "language-server", "--protocol=lsp" },

        -- Filetypes to automatically attach to.
        filetypes = { "dart" },

        -- Sets the "root directory" to the parent directory of the file in the
        -- current buffer that contains "pubspec.yaml" (Flutter & Dart projects) or a ".git" directory.
        root_markers = { "pubspec.yaml", ".git" },

        -- Optional initialization options.
        init_options = {
                closingLabels = true,
                outline = true,
                flutterOutline = true,
        },

        -- dartls doesn't require special settings typically.
        settings = {},
}
