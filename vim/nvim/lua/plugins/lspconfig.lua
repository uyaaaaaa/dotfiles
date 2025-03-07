local lsp = require("utils.lsp")

return {
    -- lsp icons
    {
        "onsails/lspkind.nvim",
        event = "InsertEnter",
        opts = {
            symbol_map = {
                BladeNav = require("utils.icons").blade,
            },
        },
    },

    -- mason / mason-lspconfig / lspconfig
    {
        "williamboman/mason.nvim",
        event = { "BufRead", "BufNewFile" },
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "jay-babu/mason-null-ls.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = lsp.lsp_servers,
            })

            local lsp_config = require("lspconfig")

            for _, lsp_server in ipairs(lsp.lsp_servers) do
                lsp_config[lsp_server].setup({
                    root_dir = function(fname)
                        return lsp_config.util.find_git_ancestor(fname) or vim.fn.getcwd()
                    end,
                })
            end
        end,
    },

    -- mason-null-ls
    {
        "jay-babu/mason-null-ls.nvim",
        cmd = "Mason",
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        opts = {
            automatic_setup = true,
            ensure_installed = vim.tbl_flatten({ lsp.formatters, lsp.diagnostics }),
            -- handlers = {},
        },
    },

    -- none-ls
    {
        "nvimtools/none-ls.nvim",
        requires = "nvim-lua/plenary.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local null_ls = require("null-ls")

            local formatting_sources = {}
            for _, tool in ipairs(lsp.formatters) do
                table.insert(formatting_sources, null_ls.builtins.formatting[tool])
            end

            local diagnostics_sources = {}
            for _, tool in ipairs(lsp.diagnostics) do
                table.insert(diagnostics_sources, null_ls.builtins.diagnostics[tool])
            end

            -- none-ls setup
            null_ls.setup({
                diagnostics_format = "[#{m}] #{s} (#{c})",
                sources = vim.tbl_flatten({ formatting_sources, diagnostics_sources }),
            })
        end,
    },

    -- -- mason-nvim-dap
    -- {
    --     "jay-babu/mason-nvim-dap.nvim",
    --     dependencies = {
    --         "williamboman/mason.nvim",
    --         "mfussenegger/nvim-dap",
    --     },
    --     opts = {
    --         ensure_installed = {
    --             "python",
    --             "php",
    --         },
    --         handlers = {},
    --     },
    -- },
}
