return {
    "RRethy/vim-illuminate",
    event = { "BufRead", "BufNewFile" },
    opts = {
        delay = 150,
        filetypes_denylist = { "dirbuf", "dirvish", "fugitive" },
    },
    config = function(_, opts)
        require("illuminate").configure(opts)
    end,
}
