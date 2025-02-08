return {
    {
        -- treesitter
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn"t work on Windows
        build = ":TSUpdate",
        event = "BufRead",
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        opts_extend = { "ensure_installed" },
        ---@type TSConfig
        ---@diagnostic disable-next-line: missing-fields
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {  -- if needed, add language.
                "bash",
                "jsdoc",
                "json",
                "markdown",
                "printf",
                "python",
                "lua",
                "vim",
                "query",
                "sql",
                "php",
                "vue",
                "javascript",
                "typescript",
                "html",
                "css",
                "diff",
                "xml",
                "yaml",
            },
        },
        ---@param opts TSConfig
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    -- treesitter-context
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = { "BufNewFile", "BufReadPre" },
        config = function(_, opts)
            require("treesitter-context").setup(opts)
        end,
    },

    -- gitsigns
    {
        "lewis6991/gitsigns.nvim",
        event = { "VeryLazy", "BufReadPre" },
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
        },
    },

    -- git diff
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffiviewFileHistory" },
        keys = {
            -- `gt`: Go to Next Tab
            { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
            { "<leader>gq", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
            { "<leader>gf", "<cmd>DiffviewFileHistory<CR>", desc = "Open File History" },
        },
        opts = {
            enhanced_diff_hl = false,
            show_help_hints = true,
            watch_index = true,
            view = {
                default = {
                    winbar_info = true,
                },
                merge_tool = {
                    layout = "diff3_mixed",
                },
                file_history = {
                    winbar_info = true,
                },
            },
            file_panel = {
                listing_style = "list",
                win_config = {
                    position = "left",
                    width = 40,
                },
            },
            file_history_panel = {
                win_config = {
                    height = 14,
                },
            },
        },
        config = function(_, opts)
            require("diffview").setup(opts)
        end,
    },

    -- NeoTree
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            {
                "<leader>e",
                function()
                    require("neo-tree.command").execute({ toggle = true })
                end,
                desc = "Explorer NeoTree",
            },
        },
        opts = {
            sources = { "filesystem", "buffers", "git_status" },
            open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
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
                bind_to_cwd = false,
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
    },

    -- Search and Replace
    {
        "MagicDuck/grug-far.nvim",
        cmd = "GrugFar",
        opts = { headerMaxWidth = 40 },
        keys = {
            {
                "<leader>ss",
                function()
                    require("grug-far").open({
                        transient = true,
                        prefills = { search = vim.fn.expand("<cword>") }
                    })
                end,
                mode = { "n", "v" },
                desc = "Search and Replace",
            },
        },
    },

    -- telescope-all-recent
    {
        "prochri/telescope-all-recent.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "kkharji/sqlite.lua",
        },
        opts = {
            database = {
                folder = vim.fn.stdpath("data"),
                file = "telescope-all-recent.sqlite3",
                max_timestamps = 5,
            },
            default = {
                sorting = "recent",
            },
        },
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        cmd = { "Telescope" },
        keys = {
            { "<C-p>", mode = { "n", "x" }, function() require("telescope.builtin").find_files() end, desc = "Find file" },
            { "<leader>ff", mode = { "n" }, function() require("telescope.builtin").live_grep() end, desc = "Grep word" },
            { "<leader>ff", mode = { "x" }, function() require("telescope.builtin").grep_string() end, desc = "Grep by selected word" },
            { "<leader>gc", mode = { "n" }, function() require("telescope.builtin").git_commits() end, desc = "Git Commit Logs" },
            { "<leader>gs", mode = { "n" }, function() require("telescope.builtin").git_status() end, desc = "Git Status" },
        },
        opts = {
            defaults = {
                initial_mode = "normal",
                path_display = { "filename_first" },
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 20,
                dynamic_preview_title = true,
                cache_picker = { num_pickers = 10 },
                -- hl_result_eol = true,
                mappings = {
                    i = {
                        ["<C-j>"] = "move_selection_next",
                        ["<C-k>"] = "move_selection_previous",
                    },
                    n = {
                        ["<S-j>"] = "preview_scrolling_down",
                        ["<S-k>"] = "preview_scrolling_up",
                        ["q"] = "close",
                    },
                },
            },
            pickers = {
                current_buffer_fuzzy_find = {
                    initial_mode = "insert",
                    previewer = false,
                    skip_empty_lines = true,
                },
                find_files = {
                    initial_mode = "insert",
                    sorting_strategy = "descending",
                    layout_config = { prompt_position = "bottom" },
                },
                live_grep = {
                    initial_mode = "insert",
                    theme = "ivy",
                    layout_config = { height = 0.45, preview_width = 0.75 },
                },
                grep_string = {
                    prompt_prefix = "",
                    theme = "ivy",
                    layout_config = { height = 0.45, preview_width = 0.75 },
                },
                lsp_references = {
                    prompt_prefix = "",
                    theme = "ivy",
                    layout_config = { height = 0.45, preview_width = 0.75 },
                },
            },
        },
        config = function(_, opts)
            require("telescope").setup(opts)
        end,
    },

    -- Indent line
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = true,
        event = "BufRead",
        main = "ibl",
        opts = {
            indent = {
                char = "│",
                repeat_linebreak = false,
            },
            exclude = {
                filetypes = {
                    "lspinfo",
                    "packer",
                    "checkhealth",
                    "help",
                    "man",
                    "gitcommit",
                    "TelescopePrompt",
                    "TelescopeResults",
                },
                buftypes = {
                    "terminal",
                    "nofile",
                    "quickfix",
                    "prompt",
                },
            },
        },
    },

    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        cmd = "ToggleTerm",
        keys = {
            { "<C-t>", function() require("toggleterm.terminal").Terminal:new():toggle() end, desc = "Open Terminal" },
            {
                "<leader>gg",
                mode = { "n" },
                function()
                    local lg = require("toggleterm.terminal").Terminal:new({
                        cmd = "lazygit",
                        dir = "git_dir",
                        direction = "float",
                        hidden = true,
                        float_opts = {
                            border = "curved",
                            winblend = 20,
                        },
                    })

                    lg:toggle()
                end,
                desc = "Open lazygit"
            },
        },
        opts = {
            size = function(term)
                if term.direction == "horizontal" then
                    return vim.o.lines * 0.4
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.35
                end
            end,
            direction = "horizontal",  -- vertical, horizontal, float, tab
            open_mapping = [[<c-t>]],
            close_on_exit = true,
            hidden = true,
        },
        config = function(_, opts)
            require("toggleterm").setup(opts)
        end,
    },

    -- hlslens
    {
        "kevinhwang91/nvim-hlslens",
        event = "VeryLazy",
        config = function()
            require("hlslens").setup({
                nearest_only = { default = true },
                nearest_float_when = { default = "never" },
            })
        end,
    },

    -- scrollbar
    {
        "petertriho/nvim-scrollbar",
        event = "WinScrolled",
        opts = {
            handlers = {
                cursor = false,
                gitsigns = true,
                search = true,
                -- ale = false, -- Requires ALE
            },
        },
        config = function(_, opts)
            require("scrollbar").setup(opts)
        end,
    },
}
