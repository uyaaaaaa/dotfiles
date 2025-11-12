return {
    -- highlighting other uses of the word under the cursor
    {
        "RRethy/vim-illuminate",
        event = { "BufRead", "BufNewFile" },
        opts = {
            delay = 150,
            filetypes_denylist = { "dirbuf", "dirvish", "fugitive" },
        },
        config = function(_, opts)
            require("illuminate").configure(opts)
        end,
    },

    -- live command
    {
        "smjonas/live-command.nvim",
        event = { "CmdlineEnter" },
        opts = {
            commands = {
                Norm = { cmd = "norm" },
            },
        },
        config = function(_, opts)
            require("live-command").setup(opts)
            vim.cmd("cnoreabbrev norm Norm")
        end,
    },

    -- todo comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        opts = {},
    },

    -- numb.nvim
    {
        "nacro90/numb.nvim",
        event = "CmdlineEnter",
        opts = {
            number_only = true,
        },
    },
}
