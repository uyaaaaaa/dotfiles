return {
    -- autopair
    {
        "altermo/ultimate-autopair.nvim",
        event= { "InsertEnter", "CmdlineEnter" },
        branch = "v0.6",
        opts = {
            pair_cmap = false,
            bs = {
                map = { "<bs>", "<C-h>", "<C-w>" },
            },
        },
    },

    -- autotag
    {
        "windwp/nvim-ts-autotag",
        ft = { "html", "xml", "js", "jsx", "tsx", "vue" },
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },

    -- auto-indent
    {
        "VidocqH/auto-indent.nvim",
        event = "InsertEnter",
        opts = {},
    },

    -- surround
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "InsertEnter",
        config = function()
            require("nvim-surround").setup()
        end,
    },

    -- flash.nvim
    {
        "folke/flash.nvim",
        event = "BufRead",
        vscode = true,
        ---@type Flash.Config
        opts = {},
        keys = {
            { "s", mode = { "n", "x" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            -- Flash With Motion (move and operation)
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        },
    },

    -- nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        version = false,
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
                experimental = {
                    ghost_text = true,
                },
                window = {
                    completion = {
                        border = "rounded",
                        zindex = 1000,
                        scrolloff = 0,
                        side_padding = 1,
                        winblend = 20,
                    },
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-Space>"] = cmp.mapping.complete(),

                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                    -- TODO: change keybind
                    ["<C-l>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-h>"] = cmp.mapping.scroll_docs(4),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = 'render-markdown' },
                }, {
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
            -- -- Set up lspconfig.
            -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
            -- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
            -- require("lspconfig")["php-language-server"].setup({
            --     capabilities = capabilities,
            -- })
        end,
    },

    -- highlighting other uses of the word under the cursor
    {
        "RRethy/vim-illuminate",
        event = "BufRead",
        opts = {
            delay = 150,
            filetypes_denylist = { "dirbuf", "dirvish", "fugitive" },
        },
        config = function(_, opts)
            require("illuminate").configure(opts)
        end,
    },
}
