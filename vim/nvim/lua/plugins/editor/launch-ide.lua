return {
    "uyaaaaaa/launch-ide.nvim",
    branch = "v0.1",
    cmd = { "LaunchIDE" },
    keys = {
        { "<leader>zed",  mode = "n", function() return require("launch-ide").exec({ name = "zed" }) end,  desc = "Open Zed" },
        { "<leader>code", mode = "n", function() return require("launch-ide").exec({ name = "vscode" }) end, desc = "Open VSCode" },
    },
    opts = {
        name = "zed",
        open_all_files = true,
        open_new_window = true,
    },
}
