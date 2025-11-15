return {
    "nvim-treesitter/nvim-treesitter",
    version = false,     -- last release is way too old and doesn"t work on Windows
    lazy = true,
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts_extend = { "ensure_installed" },
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        sync_install = false,
        ensure_installed = require("config.constants.treesitter"),
    },
}
