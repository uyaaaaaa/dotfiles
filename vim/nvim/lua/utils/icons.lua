---@class utils.icons
local M = {}

-- diagnostics
M.error = " "
M.warn = " "
M.hint = "󰌵 "
M.info = " "

-- git
M.github = ""
M.copilot = ""
M.repository = ""
M.branch = ""
M.modified = " "
M.added = " "
M.removed = " "
M.deleted = ""
M.renamed = "󰛂 "
M.untracked = " "
M.ignored = " "
M.unstaged = " "
M.staged = " "
M.conflict = ""

-- common
M.code = " "
M.windows = " "
M.linux = " "
M.mac = " "

-- file
M.readonly = "󰌾 "
M.blade = "󰫐 "

-- set diagnostic icons
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = M.error,
            [vim.diagnostic.severity.WARN] = M.warn,
            [vim.diagnostic.severity.INFO] = M.info,
            [vim.diagnostic.severity.HINT] = M.hint,
        },
    },
})

return M
