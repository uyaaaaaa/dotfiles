return {
    {
        -- treesitter
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn't work on Windows
        build = ":TSUpdate",
        event = "BufRead",
        lazy = true,
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
                "tsx",
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
        lazy = true,
        event = { "BufNewFile", "BufReadPre" },
        cmd = { "TSContextEnable" },
        config = function(_, opts)
            require("treesitter-context").setup(opts)
        end,
    },

    -- gitsigns
    {
        "lewis6991/gitsigns.nvim",
        event = { "VeryLazy", "BufReadPre" },
        opts = {
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
        lazy = true,
        event = "VeryLazy",
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
}
