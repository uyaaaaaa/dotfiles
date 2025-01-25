return {
    "navarasu/onedark.nvim",
    lazy = true,
    priority = 1000,
    config = function()
        require("onedark").setup({
            style = "warmer",
        })
        vim.cmd.colorscheme("onedark")
    end,
}

