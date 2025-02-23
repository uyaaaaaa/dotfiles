local lsp = require("utils.lsp")

return {
    -- lsp icons
    {
        "onsails/lspkind.nvim",
        event = "InsertEnter",
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

