return {
    "folke/flash.nvim",
    keys = {
        { "s", mode = { "n", "x" }, function() require("flash").jump() end,              desc = "Flash" },
        { "S", mode = { "n", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
        -- Flash With Motion (move and operation)
        { "r", mode = { "o", "x" }, function() require("flash").remote() end,            desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    },
}
