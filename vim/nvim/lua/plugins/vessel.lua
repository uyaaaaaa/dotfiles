return {
    "gcmt/vessel.nvim",
    keys = {
        { "mm", function() return require("vessel").view_global_marks() end, desc = "View Marks" },
    },
    opts = {
        window = {
            gravity = "center",
            number = false,
            cursorline = true,
            max_height = 80,
            width = function() return { 50, 90 } end,
        },
        marks = {
            preview = false,
        },
    },
}
