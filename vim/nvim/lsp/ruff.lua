return {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    settings = {
        ruff = {
            args = { "--fix", "--unsafe-fixes" },
            exclude = { ".venv" },
        }
    },
}
