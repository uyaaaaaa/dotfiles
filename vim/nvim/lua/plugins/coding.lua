return {
    -- autopair
    {
        "altermo/ultimate-autopair.nvim",
        event = { "InsertEnter", "CmdlineEnter" },
        branch = "v0.6",
        opts = {
            pair_cmap = false,
            bs = {
                map = { "<bs>", "<C-h>", "<C-w>" },
            },
        },
    },

    -- autotag
    {
        "windwp/nvim-ts-autotag",
        ft = { "html", "xml", "js", "jsx", "tsx", "vue", "blade" },
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },

    -- auto-indent
    {
        "VidocqH/auto-indent.nvim",
        event = { "BufRead", "BufNewFile" },
    },

    -- surround
    {
        "kylechui/nvim-surround",
        version = "*",
        event = { "BufRead", "BufNewFile" },
        config = function()
            require("nvim-surround").setup()
        end,
    },

    -- flash.nvim
    {
        "folke/flash.nvim",
        keys = {
            { "s", mode = { "n", "x" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S", mode = { "n", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            -- Flash With Motion (move and operation)
            { "r", mode = { "o", "x" }, function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        },
    },

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
}
