local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

local TARGET_PROCESSES = {
    "nvim",
    "vim",
    "docker",
    "node",
    "python",
    "claude",
}

---@param process_name string
---@return boolean
local function isProtectedProcess(process_name)
    for _, target in ipairs(TARGET_PROCESSES) do
        if process_name:find(target) then
            return true
        end
    end

    return false
end

function M.closePaneWithProtect(window, pane)
    local is_protected = isProtectedProcess(pane:get_foreground_process_name())

    if not is_protected then
        window:perform_action(act.CloseCurrentPane { confirm = false }, pane)
    end

    window:perform_action(act.CloseCurrentPane { confirm = true }, pane)
end

return M
