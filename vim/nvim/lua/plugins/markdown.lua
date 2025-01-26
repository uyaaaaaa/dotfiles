return {
    -- bullet
    {
        "bullets-vim/bullets.vim",
        lazy = true,
        event = "VeryLazy",
        ft = { "markdown" },
    },

    -- toggle checkbox
    {
        "roodolv/markdown-toggle.nvim",
        ft = { "markdown" },
        event = "VeryLazy",
        cmd = { "MarkdownToggle" },
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
                        local opts = { silent = true, noremap = true, buffer = args.buf, expr = true }
                        vim.keymap.set("n", "<C-c>", toggle.checkbox_dot, opts)
                        opts.expr = false
                        vim.keymap.set("v", "<C-c>", toggle.checkbox, opts)
                    end,
                })
            })
        end,
    },

    -- render-markdown
    {
        "MeanderingProgrammer/render-markdown.nvim",
        lazy = true,
        event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-treesitter/nvim-treesitter",
        },
        ft = { "markdown", "norg", "rmd", "org" },
        cmd = { "RenderMarkdown" },
        opts = {
            enabled = true,  -- Whether Markdown should be rendered by default or not
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
