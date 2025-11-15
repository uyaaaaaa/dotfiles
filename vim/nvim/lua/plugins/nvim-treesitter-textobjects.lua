return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost" },
    opts = {
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                },
                selection_modes = {
                    ["@parameter.outer"] = "v",
                    ['@function.outer'] = "V",
                    ['@class.outer'] = "<C-v>",
                },
                include_surrounding_whitespace = false,
            },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end
}
