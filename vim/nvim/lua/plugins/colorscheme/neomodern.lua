return {
    "cdmill/neomodern.nvim",
    lazy = true,
    config = function()
        local theme = "iceclimber"

        require("neomodern").setup({
            theme = theme,
            transparent = false,
        })
        -- vim.cmd.colorscheme(theme)
    end,
}

