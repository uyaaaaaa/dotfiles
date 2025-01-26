return {
    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn't work on Windows
        build = ":TSUpdate",
        event = "BufRead",
        lazy = vim.fn.argc(-1) == 0,
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        opts_extend = { "ensure_installed" },
        ---@type TSConfig
        ---@diagnostic disable-next-line: missing-fields
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {  -- if needed, add language.
                "bash",
                "jsdoc",
                "json",
                "markdown",
                "printf",
                "python",
                "lua",
                "vim",
                "query",
                "sql",
                "php",
                "tsx",
                "javascript",
                "typescript",
                "html",
                "css",
                "diff",
                "xml",
                "yaml",
            },
        },
        ---@param opts TSConfig
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    -- auto pairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        opts = {
            disable_filetype = { "TelescopePrompt", "spectre_panel" },
            map_c_h = true, -- Map the <C-h> key to delete a pair
            map_c_w = true, -- Map <c-w> to delete a pair if possible
        },
    }
}
