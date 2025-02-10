return {
    "cdmill/neomodern.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        theme = "iceclimber",  -- iceclimber|coffeecat|darkforest|roseprime|daylight
        transparent = true,
    },
    config = function(_, opts)
        require("neomodern").setup(opts)
        require("neomodern").load()
    end,
}
