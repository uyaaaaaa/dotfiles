-- modify commentstring
vim.bo.commentstring = "// %s"

-- Set blade icon
require("nvim-web-devicons").set_icon({
    ["blade.php"] = {
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

vim.treesitter.query.set("php", "folds", "([(if_statement) (switch_statement) (while_statement) (do_statement) (for_statement) (foreach_statement) (try_statement) (function_definition) (class_declaration) (interface_declaration) (trait_declaration) (enum_declaration) (function_static_declaration) (method_declaration) (namespace_use_declaration)+ (property_element) (array_creation_expression)] @fold)")

