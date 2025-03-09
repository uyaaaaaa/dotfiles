-- Add custom plugins
local M = {
    -- blade-nav
    {
        "ricardoramirezr/blade-nav.nvim",
        ft = { "blade", "php" },
        dependencies = {
            "hrsh7th/nvim-cmp",
        },
        opts = {
            cmp_close_tag = true,
            close_tag_on_complete = true,
        },
    },
}

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

return M
