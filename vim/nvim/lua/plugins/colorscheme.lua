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
            vim.cmd.colorscheme("ayu")
        end,
    },

    -- neomodern
    {
        "cdmill/neomodern.nvim",
        lazy = true,
        opts = {
            theme = "iceclimber",  -- iceclimber|coffeecat|darkforest|roseprime|daylight
            transparent = true,
        },
        config = function(_, opts)
            require("neomodern").setup(opts)
            require("neomodern").load()
        end,
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
        config = function(_, opts)
            require("night-owl").setup(opts)
            vim.cmd.colorscheme("night-owl")
        end,
    },

    -- nightfox
    -- {
    --     "EdenEast/nightfox.nvim",
    --     lazy = true,
    --     opts = {
    --         options = {
    --             transparent = true,
    --             styles = {
    --                 comments = "italic",
    --                 conditionals = "italic",
    --                 functions = "italic",
    --                 keywords = "italic",
    --             },
    --         },
    --     },
    --     config = function(_, opts)
    --         require("nightfox").setup(opts)
    --         -- vim.cmd.colorscheme("duskfox")
    --         -- vim.cmd.colorscheme("nightfox")
    --         -- vim.cmd.colorscheme("nordfox")
    --         vim.cmd.colorscheme("carbonfox")
    --     end,
    -- },

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
