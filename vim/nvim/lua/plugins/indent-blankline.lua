return {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = { "VeryLazy" },
    main = "ibl",
    opts = {
        indent = {
            char = "│",
            repeat_linebreak = false,
        },
        exclude = {
            filetypes = {
                "lspinfo",
                "packer",
                "checkhealth",
                "help",
                "man",
                "gitcommit",
                "TelescopePrompt",
                "TelescopeResults",
            },
            buftypes = {
                "terminal",
                "nofile",
                "quickfix",
                "prompt",
            },
        },
    },
}
