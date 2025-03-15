-- Setup intelephense
local M = {}

local lsp_config = require("lspconfig")
lsp_config.intelephense.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = function(fname)
        return lsp_config.util.find_git_ancestor(fname) or vim.fn.getcwd()
    end,
    settings = {
        intelephense = {
            files = {
                associations = {
                    "*.php",
                },
                includePaths = {
                    "./_ide_helper.php",
                    "./_ide_helper_models.php",
                },
            },
        },
    },
})

return M
