return {
    -- treesitter
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
            ensure_installed = { -- if needed, add language.
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
                "php_only",
                "blade",
                "phpdoc",
                "vue",
                "javascript",
                "typescript",
                "html",
                "css",
                "diff",
                "xml",
                "yaml",
                "toml",
            },
        },
        ---@param opts TSConfig
        config = function(_, opts)
            vim.filetype.add({
                pattern = {
                    [".*%.blade%.php"] = "blade",
                },
            })
            require("nvim-treesitter.configs").setup(opts)

            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            -- Add blade syntax
            parser_config.blade = {
                install_info = {
                    url = "https://github.com/EmranMR/tree-sitter-blade",
                    files = { "src/parser.c" },
                    branch = "main",
                },
                filetype = "blade",
            }
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
            { "<leader>gd", "<cmd>DiffviewOpen<CR>",        desc = "Open Diffview" },
            { "<leader>gq", "<cmd>DiffviewClose<CR>",       desc = "Close Diffview" },
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
                    require('nvim-web-devicons').set_icon({
                        ['blade.php'] = {
                            icon = require("utils.icons").blade_icon,
                            color = "#f9322c",
                            cterm_color = "Red",
                            name = "Blade",
                        }
                    })
                end,
            })
        end,
        opts = {
            enable_diagnostics = false,
            sources = { "filesystem", "buffers", "git_status" },
            open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
            hide_root_node = true,
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
                        prefills = { search = vim.fn.expand("<cword>") },
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

    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        cmd = "ToggleTerm",
        keys = {
            {
                "<C-t>",
                function()
                    require("toggleterm.terminal").Terminal:new():toggle()
                end,
                desc = "Open Terminal",
            },
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
                desc = "Open lazygit",
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
            direction = "horizontal", -- vertical, horizontal, float, tab
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
        opts = {
            nearest_only = true,
            calm_down = true,
        },
        config = function(_, opts)
            require("hlslens").setup(opts)
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
            marks = {
                Search = { text = "▌" },
                Error = { text = "▌" },
                GitAdd = { text = "▌" },
                GitChange = { text = "▌" },
            },
        },
        config = function(_, opts)
            require("scrollbar").setup(opts)
        end,
    },

    -- notify
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        opts = {
            background_colour = "#000000",
            stages = "fade",
            timeout = 3000,
        },
        config = function(_, opts)
            require("notify").setup(opts)
        end,
    },

    -- noice
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        any = {
                            { find = "%d+L, %d+B" },
                            { find = "; after #%d+" },
                            { find = "; before #%d+" },
                            { find = "more lines" },
                            { find = "fewer lines" },
                            { find = "/" },
                            { find = "No information available" },
                            { find = "1 time" },
                        },
                    },
                    opts = { skip = true },
                },
                {
                    filter = {
                        event = "notify",
                        any = {
                            { find = "hover is not supported by the servers of the current buffer" },
                            { find = "No information available" },
                        },
                    },
                    opts = { skip = true },
                },
            },
            presets = {
                command_palette = true,
                lsp_doc_border = true,
            },
        },
        config = function(_, opts)
            require("noice").setup(opts)
        end,
    },

    -- trouble
    {
        "folke/trouble.nvim",
        cmd = { "Trouble" },
        opts = {
            modes = {
                lsp = {
                    win = { position = "right" },
                },
            },
        },
        keys = {
            {
                "[q",
                function()
                    if require("trouble").is_open() then
                        require("trouble").prev({ skip_groups = true, jump = true })
                    else
                        local ok, err = pcall(vim.cmd.cprev)
                        if not ok then
                            vim.notify(err, vim.log.levels.ERROR)
                        end
                    end
                end,
                desc = "Previous Trouble/Quickfix Item",
            },
            {
                "]q",
                function()
                    if require("trouble").is_open() then
                        require("trouble").next({ skip_groups = true, jump = true })
                    else
                        local ok, err = pcall(vim.cmd.cnext)
                        if not ok then
                            vim.notify(err, vim.log.levels.ERROR)
                        end
                    end
                end,
                desc = "Next Trouble/Quickfix Item",
            },
        },
    },
}
