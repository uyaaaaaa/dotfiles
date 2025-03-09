---@class lazyvim.util.noice
local M = {}

local ignore_lists = {
    {
        event = "msg_show",
        msg = {
            "%d+L, %d+B",
            "; after #%d+",
            "; before #%d+",
            "more lines",
            "fewer lines",
            -- "/",
            "No information available",
            "1 time",
        },
    },
    {
        event = "notify",
        msg = {
            "hover is not supported by the servers of the current buffer",
            "No information available",
        },
    },
}

M.routes = {}

-- format ignore lists
for _, data in ipairs(ignore_lists) do
    local messages = {}
    for _, msg in ipairs(data.msg) do
        local t = {}
        t.find = msg
        table.insert(messages, t)
    end

    local value = {
        filter = {
            event = data.event,
            any = messages,
        },
        opts = { skip = true },
    }

    table.insert(M.routes, value)
end

return M
