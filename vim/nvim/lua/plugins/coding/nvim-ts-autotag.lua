return  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "xml", "js", "jsx", "tsx", "vue", "blade" },
    config = function()
        require("nvim-ts-autotag").setup()
    end,
}
