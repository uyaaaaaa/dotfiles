return {
    "dgox16/oldworld.nvim",
    lazy = true,
    priority = 1000,
    config = function()
        require("oldworld").setup({
            variant = "cooler",     -- "default" | "oled" | "cooler"
            highlight_overrides = {
                Constant = { fg = "#c8c7cd" },
                Define = { fg = "#c8c7cd" },
                Structure = { fg = "#c8c7cd" },
            },
        })
        -- vim.cmd.colorscheme("oldworld")
    end,
}
