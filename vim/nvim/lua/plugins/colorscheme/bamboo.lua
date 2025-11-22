return {
    "ribru17/bamboo.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("bamboo").setup({
            style = "vulgaris", -- "vulgaris" | "multiplex" | "light"
            highlights = {
                ['@comment'] = { fg = '$grey' },
            }
        })
        require("bamboo").load()
        vim.cmd.colorscheme("bamboo")
    end,
}
