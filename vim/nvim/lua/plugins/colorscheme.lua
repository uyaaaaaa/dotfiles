return {
    -- iceclimber | gyokuro | hojicha | roseprime
    {
        "cdmill/neomodern.nvim",
        lazy = true,
        config = function()
            local theme = "iceclimber"

            require("neomodern").setup({
                theme = theme,
                transparent = true,
            })
            -- vim.cmd.colorscheme(theme)
        end,
    },

    -- night-owl
    {
        "oxfist/night-owl.nvim",
        lazy = true,
        config = function()
            require("night-owl").setup({
                itaric = false,
                transparent_background = true,
            })
            -- vim.cmd.colorscheme("night-owl")
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
                    transparent = true,
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

    -- onedark
    {
        "navarasu/onedark.nvim",
        lazy = true,
        config = function()
            require("onedark").setup({
                -- dark | darker | cool | deep | warm | warmer
                style = "darker",
                transparent = true,
            })
            -- vim.cmd.colorscheme("onedark")
        end,
    },

    -- cyberdream
    {
        "scottmckendry/cyberdream.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require("cyberdream").setup({
                transparent = true,
                italic_comments = true,
            })
            -- vim.cmd.colorscheme("cyberdream")
        end,
    },

    -- nordic
    {
        "AlexvZyl/nordic.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nordic").setup({
                transparent = {
                    bg = true,
                    float = true,
                },
                bright_border = true,
                cursorline = {
                    bold = false,
                    theme = "light",
                },
            })
            vim.cmd.colorscheme("nordic")
        end,
    },

    -- oldworld
    {
        "dgox16/oldworld.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require("oldworld").setup() -- Set options if needed.
            -- vim.cmd.colorscheme("oldworld")
        end,
    },
}
