return {
    -- bullet
    {
        "bullets-vim/bullets.vim",
        ft = { "markdown" },
        event = "VeryLazy",
    },

    -- toggle checkbox
    {
        "roodolv/markdown-toggle.nvim",
        ft = { "markdown" },
        event = "VeryLazy",
        opts = {
            box_table = { "x" },
            list_table = { "*" },
        },
        config = function()
            -- Keymap of markdown-toggle
            local toggle = require("markdown-toggle")
            toggle.setup({
                vim.api.nvim_create_autocmd("FileType", {
                    desc = "markdown-toggle.nvim keymaps",
                    pattern = { "markdown", "markdown.mdx" },
                    callback = function(args)
                        vim.keymap.set("n", "<C-c>", toggle.checkbox_dot, { silent = true, noremap = true, buffer = args.buf, expr = true })
                        vim.keymap.set("v", "<C-c>", toggle.checkbox, { silent = true, noremap = true, buffer = args.buf, expr = false })
                    end,
                })
            })
        end,
    },

    -- render-markdown
    {
        "MeanderingProgrammer/render-markdown.nvim",
        event = "VeryLazy",
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
                showbreak = { default = '', rendered = '  ' },
                breakindent = { default = false, rendered = true },
                breakindentopt = { default = '', rendered = '' },
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
                    icon = '✔ ',
                    scope_highlight = "@markup.strikethrough",
                },
                custom = {
                    todo = { raw = "", rendered = "", highlight = "" },
                    canceled = {
                        raw = "[-]",
                        rendered = "✘",
                        scope_highlight = "@markup.strikethrough",
                    },
                },
            },
        },
    },
}
