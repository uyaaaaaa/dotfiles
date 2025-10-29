-- ============================================================================
-- LSP Server Definitions
-- ============================================================================
-- Each server config is loaded from lsp/<server-name>.lua
-- These configs are automatically managed by Mason (see lua/plugins/mason.lua)

---@class config.constants.lsp_servers
return {
    "pyright",        -- Python language server
    "ruff",           -- Python linter
    "intelephense",   -- PHP language server
    "bashls",         -- Bash language server
    "lua_ls",         -- Lua language server
    "yamlls",         -- YAML language server
    "jsonls",         -- JSON language server
    "taplo",          -- TOML language server
    "rust_analyzer",  -- Rust language server
    "ts_ls",          -- TypeScript/JavaScript language server
    "html-ls",        -- HTML language server
    "css-ls",         -- CSS language server
    "rubocop",        -- Ruby linter and formatter
    "marksman",       -- Markdown language server
    "gopls",          -- Go language server
    "copilot"         -- Copilot AI code assistant
}

-- M.lsp_servers = {
--     "pyright",
--     "ruff",
--     "intelephense",
--     "bashls",
--     "lua_ls",
--     "yamlls",
--     "jsonls",
--     "taplo",
--     "rust_analyzer",
--     "ts_ls",
--     "html",
--     "cssls",
--     "rubocop",
--     "marksman",
--     "gopls",
-- }
--
-- M.formatters = {
--     "djlint",
--     "black",
--     "isort",
--     "shfmt",
--     "prettier",
--     "rubocop",
-- }
--
-- M.diagnostics = {
--     "yamllint",
--     "selene",
-- }
