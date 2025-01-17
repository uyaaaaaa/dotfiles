return {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("nightfox").setup({
            options = {
                transparent = true,
                styles = {
                    comments = "italic",
                    conditionals = "italic",
                    functions = "italic",
                    keywords = "italic",
                },
            },
        })
        vim.cmd.colorscheme("duskfox")
        -- vim.cmd.colorscheme("nightfox")
        -- vim.cmd.colorscheme("nordfox")
        -- vim.cmd.colorscheme("carbonfox")
    end,
}
