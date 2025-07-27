return {
    -- iceclimber | coffeecat | darkforest | roseprime | daylight
    {
        "cdmill/neomodern.nvim",
        lazy = true,
        config = function ()
           require("neomodern").setup({
                theme = "iceclimber",
                transparent = true,
            })
            -- vim.cmd.colorscheme("iceclimber")
        end,
    },

    -- night-owl
    {
        "oxfist/night-owl.nvim",
        lazy = true,
        config = function ()
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
        config = function ()
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
        -- dark | darker | cool | deep | warm | warmer
        "navarasu/onedark.nvim",
        lazy = false,
        config = function ()
            require("onedark").setup({
                style = "darker",
                transparent = true,
            })
            vim.cmd.colorscheme("onedark")
        end,
    },

    -- cyberdream
    {
        "scottmckendry/cyberdream.nvim",
        priority = 1000,
        config = function ()
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
        lazy = true,
        priority = 1000,
        config = function()
            require("nordic").setup({
                transparent = {
                    bg = true,
                    float = true,
                },
                bright_border = true,
                cursorline = {
                    bold = true,
                },
            })
            -- vim.cmd.colorscheme("nordic")
        end,
        lazy = true,
    },
}
