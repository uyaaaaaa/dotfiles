return {
    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn"t work on Windows
        lazy = true,
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        opts_extend = { "ensure_installed" },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            sync_install = false,
            ensure_installed = require("config.constants.treesitter"),
        },
    },

    -- treesitter-context
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufRead",
        opts = {
            mode = "topline",
            max_lines = 3,
        },
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
                        modified = require("config.constants.icons").modified,
                        deleted = require("config.constants.icons").removed,
                        renamed = require("config.constants.icons").renamed,
                        untracked = require("config.constants.icons").added,
                        ignored = require("config.constants.icons").ignored,
                        unstaged = "",
                        staged = "",
                    },
                },
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
            routes = {
                {
                    view = "mini",
                    filter = {
                        event = "notify",
                        kind = "info",
                        cond = function(message)
                            return message.opts and message.opts.title and message.opts.title:find("Auto Save")
                        end,
                    },
                },
            },
            presets = {
                command_palette = true,
                lsp_doc_border = true,
            },
        },
        config = function(_, opts)
            local filters = {
                { "msg_show", "%d+L, %d+B" },
                { "msg_show", "; after #%d+" },
                { "msg_show", "; before #%d+" },
                { "msg_show", "more lines" },
                { "msg_show", "fewer lines" },
                { "msg_show", "No information available" },
                { "msg_show", "1 time" },
                { "msg_show", "Cannot write, \'buftype\' option is set" },
                { "notify", "hover is not supported by the servers of the current buffer" },
                { "notify", "No information available" },
                { "notify", "vim.ui.open: command timeout " },
            }

            local function noiceWrapper(event, pattern)
                return {
                    filter = {
                        event = event,
                        find = pattern,
                    },
                }
            end

            for _, values in pairs(filters) do
                table.insert(opts.routes, noiceWrapper(values[1], values[2]))
            end

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
            local icons = require("config.constants.icons")
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
                            separator = " ",
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

    -- nvim-ufo(folding plugins)
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
        },
        event = "BufRead",
        opts = {
            open_fold_hl_timeout = 200,
            provider_selector = function(bufnr, filetype, buftype)
                return { "treesitter", "indent" }
            end,
        },
        config = function (_, opts)
            vim.keymap.set("n", "zm", require("ufo").closeAllFolds)
            vim.keymap.set("n", "zz", require("ufo").openAllFolds)
            vim.keymap.set("n", "zf", "za", { noremap = true, silent = true })    -- Toggle
            vim.keymap.set("n", "zr", "zO", { noremap = true, silent = true })    -- Open Fold Under level
            require("ufo").setup(opts)
        end,
    },

    -- vessel
    {
        "gcmt/vessel.nvim",
        keys = {
            { "mm", function () return require("vessel").view_global_marks() end, desc = "View Marks" },
        },
        opts = {
            window = {
                gravity = "center",
                number = false,
                cursorline = true,
                max_height = 80,
                width = function() return { 50, 90 } end,
            },
            marks = {
                preview = false,
            },
        },
    },
}
