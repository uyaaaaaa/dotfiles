local wezterm = require("wezterm")

local M = {}

local PROCESSES = {
    ["nvim"]    = { icon = wezterm.nerdfonts.custom_neovim, color = "#5FB950" },
    ["vim"]     = { icon = wezterm.nerdfonts.custom_vim,    color = "#6666CC" },
    ["node"]    = { icon = wezterm.nerdfonts.fa_node_js,    color = "#84BA64" },
    ["python"]  = { icon = wezterm.nerdfonts.fa_python,     color = "#75A8D3" },
    ["git"]     = { icon = wezterm.nerdfonts.fa_git_alt,    color = "#D7834F" },
    ["lazygit"] = { icon = wezterm.nerdfonts.fa_git_alt,    color = "#D7834F" },
    ["docker"]  = { icon = wezterm.nerdfonts.fa_docker,     color = "#2560FF" },
    ["claude"]  = { icon = wezterm.nerdfonts.fa_robot,      color = "#B46102" },
    ["gemini"]  = { icon = wezterm.nerdfonts.fa_robot,      color = "#2560FF" },
    ["none"]    = { icon = wezterm.nerdfonts.dev_terminal,  color = "#4D5156" }, 
}

function M.getProcess(pane)
    local raw_process_name = pane.foreground_process_name:gsub("(.*[/\\])(.*)", "%2")
    return PROCESSES[raw_process_name] or PROCESSES["none"]
end

function M.getDirectory(pane)
    local cwd = pane:get_current_working_dir()

    if not cwd then
        return ""
    end

    local dir = cwd.file_path

    if dir == wezterm.home_dir then
        return "~"
    end

    return dir:gsub("/$", ""):match("([^/]+)$") or "/"
end

return M
