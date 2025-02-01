return {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        options = {
            transparent = true,
            styles = {
                comments = "italic",
                conditionals = "italic",
                functions = "italic",
                keywords = "italic",
            },
        },
    },
    config = function(_, opts)
        require("nightfox").setup(opts)
        -- vim.cmd.colorscheme("duskfox")
        -- vim.cmd.colorscheme("nightfox")
        -- vim.cmd.colorscheme("nordfox")
        vim.cmd.colorscheme("carbonfox")
    end,
}
