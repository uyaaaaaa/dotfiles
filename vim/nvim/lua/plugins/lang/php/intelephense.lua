-- Setup intelephense
local M = {}

local lsp_config = require("lspconfig")
lsp_config.intelephense.setup({
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
