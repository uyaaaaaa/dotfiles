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
        config = function(_, opts)
            require("ayu").setup(opts)
        end,
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
        opts = {
            itaric = false,
            transparent_background = true,
        },
    },

    -- nightfox
    {
        -- nightfox | nordfox | carbonfox | duskfox
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
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
        config = function(_, opts)
            require("nightfox").setup(opts)
            vim.cmd.colorscheme("duskfox")
        end,
    },

    -- onedark
    {
        -- dark | darker | cool | deep | warm | warmer
        "navarasu/onedark.nvim",
        lazy = true,
        opts = {
            style = "darker",
            transparent = true,
        },
    },
}
