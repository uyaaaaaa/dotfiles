return {
    "uyaaaaaa/launch-ide.nvim",
    branch = "v0.1",
    cmd = { "LaunchIDE" },
    keys = {
        { "<leader><leader>", mode = "n", function() return require("launch-ide").exec() end, desc = "Open Editor" },
    },
    opts = {
        name = "zed",
        open_all_files = true,
        open_new_window = true,
    },
}
