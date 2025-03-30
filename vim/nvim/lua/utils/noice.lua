---@class lazyvim.util.noice
local M = {
    routes = {},
}

local filters = {
    { "msg_show", "%d+L, %d+B" },
    { "msg_show", "; after #%d+" },
    { "msg_show", "; before #%d+" },
    -- { "msg_show", "/" },
    { "msg_show", "more lines" },
    { "msg_show", "fewer lines" },
    { "msg_show", "No information available" },
    { "msg_show", "1 time" },
    { "msg_show", "Cannot write, \'buftype\' option is set" },
    { "notify", "hover is not supported by the servers of the current buffer" },
    { "notify", "No information available" },
    { "notify", "vim.ui.open: command timeout " },
}

local function noiceWrapper(event, pattern)
    return {
        filter = {
            event = event,
            find = pattern,
        },
    }
end

for _, values in pairs(filters) do
    table.insert(M.routes, noiceWrapper(values[1], values[2]))
end

return M
