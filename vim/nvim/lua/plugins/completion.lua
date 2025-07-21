return {
    -- blink.cmp
    {
        "saghen/blink.cmp",
        dependencies = {
            "L3MON4D3/LuaSnip"
        },
        version = "*",
        event = { "InsertEnter", "CmdLineEnter" },
        opts = {
            completion = {
                trigger = { show_on_keyword = true },
                menu = {
                    border = "rounded",
                    draw = {
                        align_to = "cursor",
                        treesitter = { "lsp" },
                    },
                    winblend = 5,
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                    window = { border = "rounded" },
                },
            },
            snippets = { preset = "luasnip" },
            keymap = {
                preset = "super-tab",
                ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
                ["<C-j>"] = { "select_next", "fallback_to_mappings" },
                ["<C-b>"] = { function(cmp) cmp.scroll_documentation_up(2) end },
                ["<C-f>"] = { function(cmp) cmp.scroll_documentation_down(2) end },
                ["<Esc>"] = { "hide", "fallback" },
            },
            sources = {
                default = { "snippets", "lsp", "path", "buffer" },
                per_filetype = {
                    markdown = { "snippets", "lsp", "path" },
                    mdx = { "snippets", "lsp", "path" },
                },
            },
        },
        opts_extend = { "sources.default" },
    },

    -- LuaSnip
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        lazy = true,
        version = "v2.*",
        build = "make install_jsregexp",
        config = function()
            require("luasnip.loaders.from_lua").load({
                paths = "~/.config/nvim/lua/snippets/"
            })
        end,
    },

    -- lspsaga
    {
        "nvimdev/lspsaga.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        event = { "BufRead", "BufNewFile" },
        keys = {
            { "<S-k>", "<cmd>Lspsaga hover_doc<CR>", mode = "n", desc = "Hover documentation" },
        },
        opts = {
            ui = {
                code_action = "",
            },
            hover = {
                max_width = 0.7,
                max_height = 0.5,
            },
        },
    },
}
