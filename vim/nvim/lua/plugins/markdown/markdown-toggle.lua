return {
    "roodolv/markdown-toggle.nvim",
    ft = { "markdown", "mdx" },
    config = function()
        require("markdown-toggle").setup({
            cycle_box_table = true,
            box_table = { "x", "-" },
            list_table = { "-", "*" },
            list_before_box = false,
        })
        vim.keymap.set("n", "<D-l>", require("markdown-toggle").checkbox_dot,
            { silent = true, noremap = true, expr = true })
        vim.keymap.set("v", "<D-l>", require("markdown-toggle").checkbox, { silent = true, noremap = true, expr = false })
    end,
}
