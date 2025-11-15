return {
    "trevorhauter/gitportal.nvim",
    keys = {
        { "<leader>gp", mode = { "n", "v" }, function() return require("gitportal").open_file_in_browser() end, desc = "Open in Github" },
    },
    opts = {
        switch_branch_or_commit_upon_ingestion = "ask_first",
    },
}
