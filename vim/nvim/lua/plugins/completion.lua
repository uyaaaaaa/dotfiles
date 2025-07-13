local util = require("utils.fn")
local lsp = require("utils.lsp")

return {
    -- nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        version = false,
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            -- "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lsp_kind = require("cmp.types").lsp.CompletionItemKind
            cmp.setup({
                experimental = {
                    ghost_text = true,
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                formatting = {
                    format = require("lspkind").cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                        ellipsis_char = "...",
                        before = function(entry, vim_item)
                            return vim_item
                        end,
                    }),
                },
                performance = {
                    debounce = 300,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-f>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<C-j>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-k>"] = cmp.mapping.scroll_docs(4),
                }),
                sources = cmp.config.sources({
                    { name = "luasnip" },
                    {
                        name = "nvim_lsp",
                        entry_filter = function(entry, ctx)
                            return not util.list_contains(lsp.exclude_kind, lsp_kind[entry:get_kind()])
                        end,
                    },
                    { name = "render-markdown" },
                }, {
                    { name = "path" },
                    { name = "cmdline" },
                }),
            })
        end,
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
            { "<leader><leader>", "<cmd>Lspsaga hover_doc<CR>", mode = "n", desc = "Hover documentation" },
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
