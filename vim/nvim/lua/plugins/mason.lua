-- ============================================================================
-- Utility functions
-- ============================================================================

---@param fileBaseName string
---@return string|nil
local function getCorrectName(fileBaseName)
    local config_path = vim.fn.stdpath("config") .. "/lsp/" .. fileBaseName .. ".lua"

    if vim.fn.filereadable(config_path) ~= 1 then
        return nil
    end

    local ok, server_config = pcall(dofile, config_path)

    if not ok or type(server_config) ~= "table" then
        return nil
    end

    if server_config.name then
        return server_config.name
    end

    if not server_config.cmd or type(server_config.cmd) ~= "table" then
        return nil
    end

    return server_config.cmd[1]
end

---@param servers table<string>
---@return table<string>
local function convertServerName(servers)
    ---@type table<string>
    local tools = {}

    for _, server_name in ipairs(servers) do
        local name = getCorrectName(server_name) or server_name

        table.insert(tools, name)
    end

    return tools
end

-- ============================================================================
-- Mason Setup
-- ============================================================================

return {
    {
        "williamboman/mason.nvim",
        event = { "BufRead", "BufNewFile" },
        cmd = "Mason",
        build = ":MasonUpdate",
        opts = {
            ensure_installed = require("config.constants.lsp_servers")
        },
        config = function(_, opts)
            require("mason").setup(opts)

            -- Auto-install ensure_installed tools with better error handling
            local mr = require("mason-registry")
            local function ensure_installed()
                local tools = convertServerName(opts.ensure_installed)

                for _, tool in ipairs(tools) do
                    if mr.has_package(tool) then
                        local p = mr.get_package(tool)
                        if not p:is_installed() then
                            vim.notify("Mason: Installing " .. tool .. "...", vim.log.levels.INFO)
                            p:install():once("closed", function()
                                if p:is_installed() then
                                    vim.notify("Mason: Successfully installed " .. tool, vim.log.levels.INFO)
                                else
                                    vim.notify("Mason: Failed to install " .. tool, vim.log.levels.ERROR)
                                end
                            end)
                        end
                    else
                        vim.notify("Mason: Package '" .. tool .. "' not found", vim.log.levels.WARN)
                    end
                end
            end

            if mr.refresh then
                mr.refresh(ensure_installed)
            else
                ensure_installed()
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
