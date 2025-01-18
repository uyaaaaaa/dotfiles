return {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = 'Neotree',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    keys = {
        {
            '<leader>e',
            function()
                require("neo-tree.command").execute({ toggle = true })
            end,
            desc = 'Explorer NeoTree',
        },
    },
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    init = function()
        vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
        desc = "Start Neo-tree with directory",
        once = true,
        callback = function()
            if package.loaded["neo-tree"] then
                return
            else
                local stats = vim.uv.fs_stat(vim.fn.argv(0))
                if stats and stats.type == "directory" then
                    require("neo-tree")
                end
            end
        end,
        })
    end,
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
                ['<Space>'] = 'none',
                ['q'] = 'none',
                ['l'] = 'open',
                ['h'] = 'close_node',
                ['r'] = 'rename',
                ['b'] = 'rename_basename',
                ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = false } },
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
                always_show_by_pattern = {
                    ".gitignored",
                    ".env*",
                },
                never_show = {
                    ".DS_Store",
                    "thumbs.db"
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
                    unstaged = "󰄱",
                    staged = "󰱒",
                },
            },
      },
    },
}
