return {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = "ToggleTerm",
    keys = {
        {
            "<C-t>",
            function()
                require("toggleterm.terminal").Terminal:new():toggle()
            end,
            desc = "Open Terminal",
        },
    },
    opts = {
        size = function(term)
            if term.direction == "horizontal" then
                return vim.o.lines * 0.4
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.35
            end
        end,
        direction = "horizontal", -- vertical, horizontal, float, tab
        open_mapping = [[<c-t>]],
        close_on_exit = true,
        hidden = true,
    },
}
