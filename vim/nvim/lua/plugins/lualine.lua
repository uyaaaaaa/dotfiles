local icons = require("config.constants.icons")

return {
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
                    { "filetype", icon_only = true, separator = "",                   padding = { left = 1, right = 0 } },
                    { "filename", path = 1,         padding = { lefg = 0, right = 1 } },
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
                    {
                        "encoding",
                        separator = ""
                    },
                    {
                        function() return icons.github end,
                        cond = function()
                            local bufnr = vim.api.nvim_get_current_buf()
                            local clients = vim.lsp.get_clients({ bufnr = bufnr })

                            for _, client in ipairs(clients) do
                                if client.name == "copilot" then
                                    return true
                                end
                            end

                            return false
                        end,
                        color = function() return { fg = "#92b3d5" } end,
                    },
                },
                lualine_y = {
                    { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
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
}
