return {
    -- toggle
    {
        "roodolv/markdown-toggle.nvim",
        ft = { "markdown", "mdx" },
        config = function()
            require("markdown-toggle").setup({
                cycle_box_table = true,
                box_table = { "x", "-" },
                list_table = { "-", "*" },
                list_before_box = false,
            })
            vim.keymap.set("n", "<D-l>", require("markdown-toggle").checkbox_dot, { silent = true, noremap = true, expr = true })
            vim.keymap.set("v", "<D-l>", require("markdown-toggle").checkbox, { silent = true, noremap = true, expr = false })
        end,
    },

    -- bullets
    {
        "bullets-vim/bullets.vim",
        ft = { "markdown", "mdx" },
    },

    -- render
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-treesitter/nvim-treesitter",
        },
        ft = { "markdown", "mdx" },
        opts = {
            completions = { blink = { enabled = true } },
            render_modes = { "n", "no", "c", "t", "v", "V", "i" },
            link = {
                email = ' ',
                custom = {
                    linkedin = { pattern = "%linkedin%.com", icon = " " },
                },
            },
            dash = { width = 80 },
            heading = {
                width = "block",
                left_pad = 0,
                right_pad = 1,
                icons = {},
            },
            quote = { repeat_linebreak = true },
            code = {
                sign = false,
                width = "block",
                border = "thick",
                left_pad = 2,
                right_pad = 2,
                min_width = 50,
                disable_background = {},
            },
            checkbox = {
                checked = {
                    icon = ' ',
                    scope_highlight = "@markup.strikethrough",
                },
                unchecked = {
                    icon = ' ',
                    highlight = 'RenderMarkdownChecked',
                },
                custom = {
                    todo = { raw = "", rendered = "", highlight = "" },
                    canceled = {
                        raw = "[-]",
                        rendered = " ",
                        scope_highlight = "@markup.strikethrough",
                    },
                },
            },
        },
    }
}
