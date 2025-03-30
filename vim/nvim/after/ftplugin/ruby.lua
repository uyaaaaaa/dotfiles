-- ruby-lsp
local lsp_config = require("lspconfig")
lsp_config.ruby_lsp.setup({
    cmd = { "ruby-lsp" },
    filetypes = { "ruby" },
    root_dir = lsp_config.util.root_pattern("Gemfile", ".git"),
    init_options = {
        formatting = "auto",
    },
    single_file_support = true,
})

