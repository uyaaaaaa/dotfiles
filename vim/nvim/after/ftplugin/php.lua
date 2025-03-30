-- modify commentstring
vim.bo.commentstring = "// %s"

-- Set blade icon
require('nvim-web-devicons').set_icon({
    ['blade.php'] = {
        icon = require("utils.icons").blade,
        color = "#f9322c",
        cterm_color = "Red",
        name = "Blade",
    }
})

-- Add blade syntax
require("nvim-treesitter.parsers").get_parser_configs().blade = {
    install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
    },
    filetype = "blade",
}

vim.filetype.add({
    pattern = {
        [".*%.blade.%.php"] = "blade",
    },
})

-- intelephense
require("lspconfig").intelephense.setup({
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
