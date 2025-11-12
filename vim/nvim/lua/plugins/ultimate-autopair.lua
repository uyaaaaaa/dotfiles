return {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter" },
    branch = "v0.6",
    opts = {
        cmap = false,
        pair_cmap = false,
        bs = {
            map = { "<bs>", "<C-h>", "<C-w>" },
        },
        space2 = { enable = true },
    },
}

