local icons = require("config.constants.icons")

return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        {
            "<C-n>",
            function()
                require("neo-tree.command").execute({ toggle = true })
            end,
            desc = "Toggle NeoTree",
        },
    },
    deactivate = function()
        vim.cmd([[Neotree close]])
    end,
    opts = {
        enable_diagnostics = false,
        sources = { "filesystem", "buffers", "git_status" },
        open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
        retain_hidden_root_indent = true,
        window = {
            mappings = {
                ["<Space>"] = "none",
                ["q"] = "none",
                ["l"] = "open",
                ["h"] = "close_node",
                ["r"] = "rename",
                ["b"] = "rename_basename",
                ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = false } },
                ["<C-j>"] = { "scroll_preview", config = { direction = -10 } },
                ["<C-k>"] = { "scroll_preview", config = { direction = 10 } },
            },
            close_if_last_window = true,
        },
        filesystem = {
            follow_current_file = { enabled = true },
            use_libuv_file_watcher = true,
            window = {
                mappings = {
                    ["<C-f>"] = "clear_filter",
                },
                fuzzy_finder_mappings = {
                    ["<C-j>"] = "move_cursor_down",
                    ["<C-k>"] = "move_cursor_up",
                },
            },
            filtered_items = {
                visible = false,
                hide_gitignored = true,
                hide_dotfiles = false,
                always_show_by_pattern = {
                    ".gitignore",
                    ".env*",
                },
                never_show = {
                    ".git",
                    ".DS_Store",
                    "thumbs.db",
                },
            },
        },
        default_component_configs = {
            indent = {
                with_expanders = true,
                expander_collapsed = "",
                expander_expanded = "",
                expander_highlight = "NeoTreeExpander",
            },
            git_status = {
                symbols = {
                    modified = icons.modified,
                    deleted = icons.removed,
                    renamed = icons.renamed,
                    untracked = icons.added,
                    ignored = icons.ignored,
                    unstaged = "",
                    staged = "",
                },
            },
        },
    },
}
