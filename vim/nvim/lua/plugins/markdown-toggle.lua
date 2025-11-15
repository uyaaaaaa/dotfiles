return {
    "roodolv/markdown-toggle.nvim",
    ft = { "markdown" },
    opts = {
        box_table = { "x" },
        list_table = { "*" },
    },
    config = function()
        vim.keymap.set("n", "<D-l>", require("markdown-toggle").checkbox_dot,
            { silent = true, noremap = true, expr = true })
        vim.keymap.set("v", "<D-l>", require("markdown-toggle").checkbox, { silent = true, noremap = true, expr = false })
    end,
}
