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
}

M.formatters = {
    "djlint",
    "black",
    "isort",
    "stylua",
    "shfmt",
    "prettier",
}

M.diagnostics = {
    "yamllint",
    "selene",
}

return M
