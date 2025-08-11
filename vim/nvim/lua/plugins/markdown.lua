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
            vim.keymap.set("n", "<D-l>", require("markdown-toggle").checkbox_dot, { silent = true, noremap = true, expr = true })
            vim.keymap.set("v", "<D-l>", require("markdown-toggle").checkbox, { silent = true, noremap = true, expr = false })
        end,
    },

    -- render-markdown
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
                --     web = { pattern = '^http', icon = '󰖟 ' },
                --     discord = { pattern = 'discord%.com', icon = '󰙯 ' },
                --     github = { pattern = 'github%.com', icon = '󰊤 ' },
                --     google = { pattern = 'google%.com', icon = '󰊭 ' },
                --     neovim = { pattern = 'neovim%.io', icon = ' ' },
                --     reddit = { pattern = 'reddit%.com', icon = '󰑍 ' },
                --     stackoverflow = { pattern = 'stackoverflow%.com', icon = '󰓌 ' },
                --     wikipedia = { pattern = 'wikipedia%.org', icon = '󰖬 ' },
                --     youtube = { pattern = 'youtube%.com', icon = '󰗃 ' },
                    linkedin = { pattern = "%linkedin%.com", icon = " " },
                },
            },
            dash = { width = 80 },
            heading = {
                sign = false,
                width = "block",
                left_pad = 0,
                right_pad = 1,
                icons = {},
            },
            quote = { repeat_linebreak = true },
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
    },
}
