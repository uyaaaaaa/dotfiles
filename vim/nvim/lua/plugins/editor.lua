return {
    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn"t work on Windows
        lazy = true,
        build = ":TSUpdate",
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        opts_extend = { "ensure_installed" },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = require("utils.treesitter").list
        },
        config = function(_, opts)
            vim.filetype.add({
                pattern = {
                    [".*%.blade%.php"] = "blade",
                },
            })
            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    -- treesitter-context
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufRead",
        opts = {},
    },

    -- gitsigns
    {
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

                map("n", "g[", gitsigns.next_hunk)
                map("n", "g]", gitsigns.prev_hunk)
                map("n", "<leader>gd", function() gitsigns.diffthis(nil, { split = "aboveleft" }) end)
                map("n", "gs", gitsigns.stage_hunk)
                map("v", "gs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end)
                map("n", "ge", function() gitsigns.setloclist(nil, "all") end)
                map("n", "ga", gitsigns.stage_buffer)
            end
        },
    },

    -- gitportal
    {
        "trevorhauter/gitportal.nvim",
        keys = {
            { "<leader>gp", mode = { "n", "v" }, function() return require("gitportal").open_file_in_browser() end, desc = "Open in Github" },
        },
        opts = {
            switch_branch_or_commit_upon_ingestion = "ask_first",
        },
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
                end,
            })
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
                        modified = "M",
                        deleted = "D",
                        renamed = "R",
                        untracked = "A",
                        unstaged = "",
                        ignored = require("utils.icons").ignored,
                        staged = require("utils.icons").added,
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
    },

    -- hlslens
    {
        "kevinhwang91/nvim-hlslens",
        keys = {
            { "*", mode = "n", "*<Cmd>lua require('hlslens').start()<CR>", desc = "Search current word with hlslens" },
        },
        opts = {
            nearest_only = true,
            calm_down = true,
        },
    },

    -- scrollbar
    {
        "petertriho/nvim-scrollbar",
        event = { "BufRead", "BufNewFile" },
        opts = {
            handlers = {
                cursor = false,
                gitsigns = true,
                search = true,
                -- ale = false, -- Requires ALE
            },
            marks = {
                Search = { text = "▌" },
                Error = { text = { "▌" } },
                GitAdd = { text = "▌" },
                GitChange = { text = "▌" },
            },
        },
    },

    -- notify
    {
        "rcarriga/nvim-notify",
        lazy = true,
        opts = {
            background_colour = "#000000",
            stages = "fade",
            timeout = 3000,
        },
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
            routes = require("utils.noice").routes,
            presets = {
                command_palette = true,
                lsp_doc_border = true,
            },
        },
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

    -- bufferline
    {
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
            },
        },
    },

    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        event = "VeryLazy",
        init = function()
            vim.g.lualine_laststatus = vim.o.laststatus
            if vim.fn.argc(-1) > 0 then
                vim.o.statusline = " "
            else
                vim.o.laststatus = 0
            end
        end,
        opts = function()
            require("lualine_require").require = require
            vim.o.laststatus = vim.g.lualine_laststatus
            local icons = require("utils.icons")
            local git_repo = vim.fn.fnamemodify(vim.fn.systemlist("git rev-parse --show-toplevel")[1], ":t") or ""

            local opts = {
                options = {
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    globalstatus = vim.o.laststatus == 3,
                    disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },

                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = {
                        {
                            function() return git_repo end,
                            icon = icons.repository,
                            color = function() return { fg = Snacks.util.color("Statement") } end,
                            padding = { left = 1, right = 0 },
                        },
                        {
                            "branch",
                            icon = icons.branch,
                            color = function() return { fg = Snacks.util.color("Constant") } end,
                        },
                    },
                    lualine_c = {
                        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                        { "filename", path = 1, padding = { lefg = 0, right = 1 } },
                    },
                    lualine_x = {
                        {
                            function() return require("noice").api.status.command.get() end,
                            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
                            color = function() return { fg = Snacks.util.color("Statement") } end,
                            separator = "",
                        },
                        {
                            function() return "  " .. require("dap").status() end,
                            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
                            color = function() return { fg = Snacks.util.color("Debug") } end,
                        },
                        {
                            "diagnostics",
                            sections = { "error", "warn" },
                            symbols = {
                                error = icons.error,
                                warn  = icons.warn,
                                info  = icons.info,
                                hint  = icons.hint,
                            },
                            always_visible = true,
                            separator = "",
                        },
                        "encoding",
                    },
                    lualine_y = {
                        { "progress", separator = " ", padding = { left = 1, right = 0 } },
                        { "location", padding = { left = 0, right = 1 } },
                    },
                    lualine_z = {
                        function()
                            return " " .. os.date("%R")
                        end,
                    },
                },
                extensions = { "neo-tree", "lazy", "fzf", "toggleterm" },
            }

            return opts
        end,
    },

}
