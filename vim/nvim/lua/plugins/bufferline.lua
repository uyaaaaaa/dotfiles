return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = { "BufRead", "BufNew" },
    keys = {
        { "<S-h>",     "<cmd>BufferLineCyclePrev<cr>",    desc = "Prev Buffer" },
        { "<S-l>",     "<cmd>BufferLineCycleNext<cr>",    desc = "Next Buffer" },
        { "<leader>w", function() Snacks.bufdelete() end, desc = "Next Buffer" },
        { "<leader>b", "<cmd>BufferLinePickClose<cr>",    desc = "Close Buffer With Select" }
    },
    opts = {
        options = {
            show_close_icon = false,
            right_mouse_command = function(n) Snacks.bufdelete(n) end,
            diagnostics = "nvim_lsp",
            always_show_bufferline = true,
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "Neo-tree",
                    highlight = "Directory",
                    text_align = "left",
                },
            },
            groups = {
                options = {
                    toggle_hidden_on_enter = true,
                },
                items = {
                    {
                        name = "Tests",
                        auto_close = true,
                        matcher = function()
                            local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
                            return filename:match('%Test')
                        end,
                    },
                },
            },
        },
    },
}
