return {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = 'Neotree',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    keys = {
      { '<leader>e', ':Neotree toggle<CR>' },
    },
    opts = {
        sources = { 'filesystem', 'buffers', 'git_status' },
        open_files_do_not_replace_types = { 'terminal', 'Trouble', 'trouble', 'qf', 'Outline' },
        filesystem = {
            bind_to_cwd = false,
            follow_current_file = { enabled = true },
            use_libuv_file_watcher = true,
        },
        window = {
            mappings = {
                ['<space>'] = 'none',
                ['l'] = 'open',
                ['h'] = 'close_node',
                ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
                ["<C-j>"] = { "scroll_preview", config = { direction = -10 } },
                ["<C-k>"] = { "scroll_preview", config = { direction = 10 } },
            },
            close_if_last_window = true,
        },
        filesystem = {
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
                always_show = {
                    ".gitignored",
                },
                always_show_by_pattern = {
                    ".env*",
                },
                never_show = {
                    ".DS_Store",
                    "thumbs.db"
                },
            },
        },
    },
}
