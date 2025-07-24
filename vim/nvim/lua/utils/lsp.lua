---@class lazyvim.util.lsp
local M = {}

M.lsp_servers = {
    "pyright",
    "ruff",
    "intelephense",
    "bashls",
    "lua_ls",
    "yamlls",
    "jsonls",
    "taplo",
    "rust_analyzer",
    "ts_ls",
    "html",
    "cssls",
    "rubocop",
    "marksman",
    "gopls",
}

M.formatters = {
    "djlint",
    "black",
    "isort",
    "stylua",
    "shfmt",
    "prettier",
    "rubocop",
}

M.diagnostics = {
    "yamllint",
    "selene",
}

M.ignored_messages = {
    -- lua
    "Undefined global `vim`",
    -- php
}

return M
