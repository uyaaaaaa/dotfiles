local lsp = require("utils.lsp")
local icons = require("utils.icons")

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
            "saghen/blink.cmp",
            "jay-babu/mason-null-ls.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason").setup()

            local capabilities = require("blink.cmp").get_lsp_capabilities()

            require("mason-lspconfig").setup({
                ensure_installed = lsp.lsp_servers,
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                            root_dir = function(fname)
                                return require("lspconfig").util.find_git_ancestor(fname) or vim.fn.getcwd()
                            end,
                        })
                    end,
                }
            })
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

            -- set diagnostic icons
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = icons.error,
                        [vim.diagnostic.severity.WARN] = icons.warn,
                        [vim.diagnostic.severity.INFO] = icons.info,
                        [vim.diagnostic.severity.HINT] = icons.hint,
                    },
                },
                -- virtual_lines = true,
                update_in_insert = true,
                virtual_text = {
                    format = function(diagnostic)
                        local severity = { "ERROR", "WARN", "INFO", "HINT" }
                        return string.format("%s: %s", severity[diagnostic.severity], diagnostic.message)
                    end,
                },
            })

            local original_publish_diagnostics = vim.lsp.handlers["textDocument/publishDiagnostics"]

            vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
                if not result or not result.diagnostics then
                    return original_publish_diagnostics(err, result, ctx, config)
                end

                local filtered_diagnostics = {}

                for _, d in ipairs(result.diagnostics) do
                    local should_ignore = false

                    for _, pattern in ipairs(lsp.ignored_messages) do
                        if string.find(d.message, pattern, 1, true) then
                            should_ignore = true
                            break
                        end
                    end

                    if not should_ignore then
                        -- Define display diagnostic
                        table.insert(filtered_diagnostics, d)
                    end
                end

                -- Override diagnostics by filtered diagnostics
                result.diagnostics = filtered_diagnostics

                return original_publish_diagnostics(err, result, ctx, config)
            end

            -- none-ls setup
            null_ls.setup({
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
