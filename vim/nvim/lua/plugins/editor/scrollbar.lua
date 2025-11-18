return {
    "petertriho/nvim-scrollbar",
    event = { "WinScrolled" },
    opts = {
        handlers = {
            cursor = false,
            gitsigns = true,
            search = true,
            -- ale = false, -- Requires ALE
        },
        marks = {
            Search = { text = "▌" },
            Error = { text = { "▌" } },
            GitAdd = { text = "▌" },
            GitChange = { text = "▌" },
        },
    },
}
