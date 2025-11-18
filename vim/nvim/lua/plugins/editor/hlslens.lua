return {
    "kevinhwang91/nvim-hlslens",
    keys = {
        { "*", mode = "n", "*<Cmd>lua require('hlslens').start()<CR>", desc = "Search current word with hlslens" },
    },
    opts = {
        nearest_only = true,
        calm_down = true,
    },
}
