return {
    "kylechui/nvim-surround",
    version = "*",
    event = { "BufRead", "BufNewFile" },
    config = function()
        require("nvim-surround").setup()
    end,
}

