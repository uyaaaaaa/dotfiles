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
    "marksman"
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

M.exclude_kind = {
    "Variable",
    "Text",
}

return M
