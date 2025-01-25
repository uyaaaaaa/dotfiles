return {
    "oxfist/night-owl.nvim",
    lazy = true,
    priority = 1000,
    config = function()
        require("night-owl").setup({
            itaric = false,
            transparent_background = true,
        })
        vim.cmd.colorscheme("night-owl")
    end,
}

