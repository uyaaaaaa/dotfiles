return {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
        attach_to_untracked = true,
        current_line_blame = true,
        current_line_blame_opts = {
            delay = 750,
        },
        signs = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = "" },
            topdelete = { text = "" },
            changedelete = { text = "▎" },
            untracked = { text = "▎" },
        },
        signs_staged = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = "" },
            topdelete = { text = "" },
            changedelete = { text = "▎" },
        },
        on_attach = function(bufnr)
            local gitsigns = require("gitsigns")

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            map("n", "[g", gitsigns.next_hunk)
            map("n", "]g", gitsigns.prev_hunk)
            map("n", "<leader>gd", function() gitsigns.diffthis(nil, { split = "aboveleft" }) end)
            map("n", "gs", gitsigns.stage_hunk)
            map("v", "gs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end)
            map("n", "ge", function() gitsigns.setloclist(nil, "all") end)
            map("n", "ga", gitsigns.stage_buffer)
            map("n", "<leader>gi", gitsigns.preview_hunk_inline)
        end
    },
}
