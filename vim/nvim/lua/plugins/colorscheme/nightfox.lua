return {
    -- nightfox | nordfox | carbonfox | duskfox
    "EdenEast/nightfox.nvim",
    lazy = true,
    priority = 1000,
    config = function()
        require("nightfox").setup({
            options = {
                transparent = false,
                styles = {
                    comments = "italic",
                    conditionals = "italic",
                    functions = "italic",
                    keywords = "italic",
                },
            },
        })
        -- vim.cmd.colorscheme("nordfox")
    end,
}
