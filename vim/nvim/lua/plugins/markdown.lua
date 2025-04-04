return {
    -- bullet
    {
        "bullets-vim/bullets.vim",
        ft = { "markdown" },
    },

    -- toggle checkbox
    {
        "roodolv/markdown-toggle.nvim",
        ft = { "markdown" },
        opts = {
            box_table = { "x" },
            list_table = { "*" },
        },
        config = function()
            vim.keymap.set("n", "<leader>d", require("markdown-toggle").checkbox_dot, { silent = true, noremap = true, expr = true })
            vim.keymap.set("v", "<leader>d", require("markdown-toggle").checkbox, { silent = true, noremap = true, expr = false })
        end,
    },

    -- render-markdown
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-treesitter/nvim-treesitter",
        },
        ft = { "markdown", "norg", "rmd", "org" },
        opts = {
            render_modes = { "n", "no", "c", "t", "v", "V", "i" },
            heading = {
                sign = false,
                width = "block",
                left_pad = 0,
                right_pad = 1,
                icons = {},
            },
            quote = {
                repeat_linebreak = true,
            },
            win_options = {
                showbreak = { default = "", rendered = "  " },
                breakindent = { default = false, rendered = true },
                breakindentopt = { default = "", rendered = "" },
            },
            code = {
                sign = false,
                width = "block",
                left_pad = 2,
                right_pad = 2,
                min_width = 50,
                disable_background = {},
            },
            checkbox = {
                checked = {
                    icon = "✔ ",
                    scope_highlight = "@markup.strikethrough",
                },
                custom = {
                    todo = { raw = "", rendered = "", highlight = "" },
                    canceled = {
                        raw = "[-]",
                        rendered = "󰅘 ",
                        scope_highlight = "@markup.strikethrough",
                    },
                },
            },
        },
    },
}
