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
            cmp.setup({
                experimental = { ghost_text = true },
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
                        symbol_map = { Copilot = require("utils.icons").copilot }
                    }),
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.confirm({ select = true })
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                }),
                sources = cmp.config.sources({
                    { name = "copilot" },
                    { name = "luasnip" },
                    { name = "nvim_lsp" },
                    { name = "render-markdown" },
                }, {
                    -- { name = "buffer" },
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

    -- copilot-cmp
    {
        "zbirenbaum/copilot-cmp",
        event = { "InsertEnter", "LspAttach" },
        dependencies = {
            "hrsh7th/nvim-cmp",
            "zbirenbaum/copilot.lua",
        },
        fix_pairs = true,
        -- config = function()
        --     require("copilot").setup({
        --         suggestion = { enabled = false },
        --         panel = { enabled = false },
        --     })
        --     require("copilot_cmp").setup()
        -- end,
    },

    -- copilot
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        lazy = true,
    },
}
