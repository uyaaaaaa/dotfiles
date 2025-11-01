return {
    cmd = { "css-lsp", "--stdio" },
    filetypes = { "css", "scss", "less" },
    root_markers = { "package.json", ".git" },
    settings = {
        css = { validate = true },
        scss = { validate = true },
        less = { validate = true },
    },
}
