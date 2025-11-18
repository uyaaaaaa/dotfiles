return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
    },
    event = "BufRead",
    opts = {
        open_fold_hl_timeout = 200,
        provider_selector = function(bufnr, filetype, buftype)
            return { "treesitter", "indent" }
        end,
    },
    config = function(_, opts)
        vim.keymap.set("n", "zm", require("ufo").closeAllFolds)
        vim.keymap.set("n", "zz", require("ufo").openAllFolds)
        vim.keymap.set("n", "zf", "za", { noremap = true, silent = true }) -- Toggle
        vim.keymap.set("n", "zr", "zO", { noremap = true, silent = true }) -- Open Fold Under level
        require("ufo").setup(opts)
    end,
}
