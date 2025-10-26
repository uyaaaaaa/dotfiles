return {
    -- snacks
    {
        "folke/snacks.nvim",
        lazy = true,
        keys = {
            { "g/", mode = "n", function() Snacks.picker.grep({ finder = "grep", format = "file", }) end, desc = "Grep" },
            { "g/", mode = "x", function() Snacks.picker.grep_word({ finder = "grep", format = "file", search = function(picker) return picker:word() end, }) end, desc = "Grep" },
            { "<C-p>", function() Snacks.picker.files({ finder = "files", format = "file", layout = "vscode", }) end, desc = "Find Files", },
            { "<leader>t", mode = "n", function() Snacks.picker.todo_comments({ keywords = { "TODO" } }) end,         desc = "Search Todo Comments" },
            { "<leader>f", mode = "n", function() Snacks.picker.todo_comments({ keywords = { "FIX", "FIXME" } }) end, desc = "Search Fix Comments" },
            { "<leader>n", mode = "n", function() Snacks.picker.todo_comments({ keywords = { "NOTE" } }) end,         desc = "Search Note Comments" },
        },
        opts = {
            picker = {
                layout = {
                    cycle = true,
                    preset = "vertical",
                },
                layouts = {
                    ivy = {
                        layout = {
                            box = "vertical",
                            backdrop = false,
                            row = -1,
                            height = 0.45,
                            border = "top",
                            title = " {title} {live} {flags}",
                            title_pos = "left",
                            { win = "input", height = 1, border = "bottom" },
                            {
                                box = "horizontal",
                                { win = "list",    border = "none" },
                                { win = "preview", title = "{preview}", width = 0.6, border = "left" },
                            },
                        },
                    },
                    vertical = {
                        layout = {
                            backdrop = false,
                            width = 0.8,
                            min_width = 80,
                            height = 0.9,
                            min_height = 30,
                            box = "vertical",
                            border = "rounded",
                            title = "{title} {live} {flags}",
                            title_pos = "center",
                            { win = "input",   height = 1,          border = "bottom" },
                            { win = "list",    border = "none",     height = 0.4 },
                            { win = "preview", title = "{preview}", border = "top" },
                        },
                    },
                    vscode = {
                        layout = {
                            width = 0.6,
                            min_height = 35,
                            border = "rounded",
                        },
                    }
                },
                matcher = {
                    frecency = true,
                    sort_empty = true,
                },
                win = {
                    input = {
                        keys = {
                            ["<C-f>"] = false,
                            ["<C-b>"] = false,
                            ["<Esc>"] = { "close", mode = { "n", "i" } },
                            ["<C-e>"] = { "close", mode = { "n", "i" } },
                            ["<S-j>"] = { "preview_scroll_down", mode = { "i", "n" } },
                            ["<S-k>"] = { "preview_scroll_up", mode = { "i", "n" } },
                            ["<C-h>"] = { "preview_scroll_left", mode = { "i", "n" } },
                            ["<C-l>"] = { "preview_scroll_right", mode = { "i", "n" } },
                        },
                    },
                },
            },
        },
    },
}
