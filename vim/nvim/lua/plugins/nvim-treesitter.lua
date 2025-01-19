-- Syntax Highlight
return {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "VeryLazy" },
    lazy = vim.fn.argc(-1) == 0,
    config = function ()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {  -- if needed, add language.
                "python",
                "lua",
                "vim",
                "query",
                "sql",
                "php",
                "javascript",
                "typescript",
                "html",
                "css",
                "diff",
            },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
