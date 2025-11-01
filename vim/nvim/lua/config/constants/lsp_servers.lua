-- ============================================================================
-- LSP Server Definitions
-- ============================================================================
-- Each server config is loaded from lsp/<server-name>.lua
-- These configs are automatically managed by Mason (see lua/plugins/mason.lua)

return {
    -- LSP
    "pyright",         -- python
    "intelephense",    -- php
    "taplo",           -- toml
    "rust-analyzer",   -- rust
    "marksman",        -- markdown
    "gopls",           -- go
    "json-lsp",        -- json
    "html-ls",         -- html
    "css-ls",          -- css
    "lua-ls",          -- lua
    "bash-ls",         -- bash
    "yaml-ls",         -- yaml
    "ts-ls",           -- typescript/javascript

    -- Linter
    "selene",          -- lua
    "ruff",            -- python
    "rubocop",         -- ruby

    -- Formatter
    "prettier",        -- html/css
    "php-cs-fixer",    -- php
}

