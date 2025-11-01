return {
    cmd = { "html-lsp", "--stdio" },
    filetypes = {
        "html",
        "blade",
        "javascriptreact",
        "typescriptreact",
        "svelte",
    },
    root_markers = { "index.html", ".git" },
    init_options = { provideFormatter = true },
}
