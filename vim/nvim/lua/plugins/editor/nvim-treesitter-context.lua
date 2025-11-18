return {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "WinScrolled",
    opts = {
        mode = "topline",
        max_lines = 3,
    },
}
