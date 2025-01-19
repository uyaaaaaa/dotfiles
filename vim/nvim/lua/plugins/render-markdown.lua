-- Markdown
return {
    "MeanderingProgrammer/render-markdown.nvim",
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
}
