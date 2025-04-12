---@class lazyvim.util.fn
local M = {}

function M.list_contains(list, value)
    for _, v in ipairs(list) do
        if v == value then
            return true
        end
    end

    return false
end

return M
