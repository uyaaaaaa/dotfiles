return {
    name = "pyright",
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "requirements.txt", "pyrightconfig.json", "pyproject.toml" },
    settings = {
        python = {
            pythonPath = ".venv/bin/python",
            analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
            },
        },
    },
}
