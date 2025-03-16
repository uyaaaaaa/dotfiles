return {
    -- ayu
    {
        "Shatur/neovim-ayu",
        lazy = true,
        opts = {
            -- transparency
            overrides = {
                Normal = { bg = "None" },
                ColorColumn = { bg = "None" },
                SignColumn = { bg = "None" },
                Folded = { bg = "None" },
                FoldColumn = { bg = "None" },
                CursorLine = { bg = "None" },
                CursorColumn = { bg = "None" },
                WhichKeyFloat = { bg = "None" },
                VertSplit = { bg = "None" },
            },
        },
    },

    -- iceclimber | coffeecat | darkforest | roseprime | daylight
    {
        "cdmill/neomodern.nvim",
        lazy = true,
        opts = {
            theme = "iceclimber",
            transparent = true,
        },
    },

    -- night-owl
    {
        "oxfist/night-owl.nvim",
        lazy = true,
        priority = 1000,
        opts = {
            itaric = false,
            transparent_background = true,
        },
    },

    -- nightfox
    {
        -- nightfox | nordfox | carbonfox | duskfox
        "EdenEast/nightfox.nvim",
        lazy = true,
        opts = {
            options = {
                transparent = true,
                styles = {
                    comments = "italic",
                    conditionals = "italic",
                    functions = "italic",
                    keywords = "italic",
                },
            },
        },
    },

    -- onedark
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "warmer",
            transparent = true,
        },
        config = function(_, opts)
            require("onedark").setup(opts)
            vim.cmd.colorscheme("onedark")
        end,
    },
}
