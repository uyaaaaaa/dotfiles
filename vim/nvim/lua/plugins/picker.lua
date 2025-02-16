return {
    -- snacks
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            picker = {
            -- your picker configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            },
        },
    },

    -- telescope-all-recent
    -- {
    --     "prochri/telescope-all-recent.nvim",
    --     dependencies = {
    --         "nvim-telescope/telescope.nvim",
    --         "kkharji/sqlite.lua",
    --     },
    --     keys = {
    --         { "<c-p>", mode = { "n", "x" }, function() require("telescope.builtin").find_files() end, desc = "find file" },
    --         { "<leader><leader>", mode = { "n" }, function() require("telescope.builtin").live_grep() end, desc = "grep word" },
    --         { "<leader><leader>", mode = { "x" }, function() require("telescope.builtin").grep_string() end, desc = "grep by selected word" },
    --         { "<leader>gc", mode = { "n" }, function() require("telescope.builtin").git_commits() end, desc = "git commit logs" },
    --         { "<leader>gs", mode = { "n" }, function() require("telescope.builtin").git_status() end, desc = "git status" },
    --     },
    --     opts = {
    --         database = {
    --             folder = vim.fn.stdpath("data"),
    --             file = "telescope-all-recent.sqlite3",
    --             max_timestamps = 5,
    --         },
    --         default = {
    --             sorting = "recent",
    --         },
    --     },
    -- },

    -- telescope
    -- {
    --     "nvim-telescope/telescope.nvim",
    --     tag = "0.1.8",
    --     lazy = true,
    --     opts = {
    --         defaults = {
    --             initial_mode = "normal",
    --             path_display = { "filename_first" },
    --             layout_config = { prompt_position = "top" },
    --             sorting_strategy = "ascending",
    --             winblend = 20,
    --             dynamic_preview_title = true,
    --             cache_picker = { num_pickers = 10 },
    --             -- hl_result_eol = true,
    --             mappings = {
    --                 i = {
    --                     ["<C-j>"] = "move_selection_next",
    --                     ["<C-k>"] = "move_selection_previous",
    --                 },
    --                 n = {
    --                     ["<S-j>"] = "preview_scrolling_down",
    --                     ["<S-k>"] = "preview_scrolling_up",
    --                     ["q"] = "close",
    --                 },
    --             },
    --         },
    --         pickers = {
    --             find_files = {
    --                 initial_mode = "insert",
    --             },
    --             live_grep = {
    --                 initial_mode = "insert",
    --                 theme = "dropdown",
    --                 prompt_position = "top",
    --                 layout_config = { width = 0.7 },
    --             },
    --             grep_string = {
    --                 prompt_prefix = "",
    --                 theme = "ivy",
    --                 layout_config = { height = 0.45, preview_width = 0.6 },
    --             },
    --             lsp_references = {
    --                 prompt_prefix = "",
    --                 theme = "ivy",
    --                 layout_config = { height = 0.45, preview_width = 0.6 },
    --             },
    --         },
    --     },
    --     config = function(_, opts)
    --         require("telescope").setup(opts)
    --     end,
    -- },

}
