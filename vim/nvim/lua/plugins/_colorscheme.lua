return {
    -- iceclimber | gyokuro | hojicha | roseprime
    {
        "cdmill/neomodern.nvim",
        lazy = true,
        config = function()
            local theme = "iceclimber"

            require("neomodern").setup({
                theme = theme,
                transparent = false,
            })
            -- vim.cmd.colorscheme(theme)
        end,
    },

    -- nightfox
    {
        -- nightfox | nordfox | carbonfox | duskfox
        "EdenEast/nightfox.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require("nightfox").setup({
                options = {
                    transparent = false,
                    styles = {
                        comments = "italic",
                        conditionals = "italic",
                        functions = "italic",
                        keywords = "italic",
                    },
                },
            })
            -- vim.cmd.colorscheme("duskfox")
        end,
    },

    {
        "ribru17/bamboo.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require("bamboo").setup({
                style = "vulgaris", -- "vulgaris" | "multiplex" | "light"
            })
            require("bamboo").load()
        end,
    },

    -- oldworld
    {
        "dgox16/oldworld.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("oldworld").setup({
                variant = "cooler", -- "default" | "oled" | "cooler"
                highlight_overrides = {
                    Constant = { fg = "#c8c7cd" },
                    Define = { fg = "#c8c7cd" },
                    Structure = { fg = "#c8c7cd" },
                },
            })
            vim.cmd.colorscheme("oldworld")
        end,
    },
}
