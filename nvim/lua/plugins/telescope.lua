local keymap = require("vim.keymap")
local builtin = require("telescope.builtin")

keymap.set("n", "ff", builtin.live_grep, {})
keymap.set("v", "ff", builtin.grep_string, {})

return {
  {
    "prochri/telescope-all-recent.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "kkharji/sqlite.lua",
    },
    opts = {
      database = {
        folder = vim.fn.stdpath("data"),
        file = "telescope-all-recent.sqlite3",
        max_timestamps = 7,
      },
      default = {
        sorting = "recent",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "cc", require("telescope.builtin").command_history },
      { "<C-g>c", require("telescope.builtin").git_commits, desc = "Git Commit Logs" },
      { "<C-g>s", require("telescope.builtin").git_status, desc = "Git Status" },
      { "<C-g>b", require("telescope.builtin").git_branches, desc = "Git Branch" },
      {
        "<C-p>",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Search File",
      },
    },
    opts = {
      defaults = {
        initial_mode = "normal",
        path_display = {
          "filename_first",
        },
        layout_config = {
          preview_width = 0.70,
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        winblend = 30,
        dynamic_preview_title = true,
        cache_picker = {
          num_pickers = 10,
        },
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<C-c>"] = "close", -- close telescope
          },
          n = {
            ["<S-j>"] = "preview_scrolling_down",
            ["<S-k>"] = "preview_scrolling_up",
            ["<S-h>"] = "preview_scrolling_left",
            ["<S-l>"] = "preview_scrolling_right",
            ["<C-c>"] = "close", -- close telescope
            ["l"] = "select_default", -- select buffer
          },
        },
      },
      pickers = {
        find_files = {
          previewer = false,
          initial_mode = "insert",
          hidden = true,
          layout_config = {
            width = 0.45,
          },
        },
        live_grep = {
          initial_mode = "insert",
          use_regex = true,
        },
        grep_string = {
          prompt_prefix = "",
        },
      },
    },
  },
}
