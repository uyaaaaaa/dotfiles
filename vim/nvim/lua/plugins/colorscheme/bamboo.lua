return {
    "ribru17/bamboo.nvim",
    lazy = true,
    priority = 1000,
    config = function()
        require("bamboo").setup({
            style = "vulgaris", -- "vulgaris" | "multiplex" | "light"
        })
        require("bamboo").load()
    end,
}

