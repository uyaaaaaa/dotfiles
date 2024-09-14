local keymap = require("vim.keymap")
local builtin = require("telescope.builtin")

keymap.set("n", "ff", builtin.live_grep, {})
keymap.set("v", "ff", builtin.grep_string, {})
keymap.set("n", "<leader>fa", function()
  builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown())
end, { noremap = true })

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
      { "<C-g>c", require("telescope.builtin").git_commits, desc = "Git Commit Logs" },
      { "<C-g>s", require("telescope.builtin").git_status, desc = "Git Status" },
      { "<C-g>b", require("telescope.builtin").git_branches, desc = "Git Branch" },
    },
    opts = {
      defaults = {
        initial_mode = "normal",
        path_display = { "filename_first" },
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 20,
        dynamic_preview_title = true,
        cache_picker = { num_pickers = 10 },
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
        current_buffer_fuzzy_find = {
          initial_mode = "insert",
          previewer = false,
          skip_empty_lines = true,
        },
        find_files = {
          theme = "dropdown",
          previewer = false,
          initial_mode = "insert",
          hidden = true,
          layout_config = { height = 0.6, width = 0.5 },
        },
        live_grep = {
          initial_mode = "insert",
          use_regex = true,
          theme = "ivy",
          layout_config = { height = 0.45, preview_width = 0.75 },
        },
        grep_string = {
          prompt_prefix = "",
          theme = "ivy",
          layout_config = { height = 0.45, preview_width = 0.75 },
        },
        lsp_references = {
          prompt_prefix = "",
          theme = "ivy",
          layout_config = { height = 0.45, preview_width = 0.75 },
        },
      },
    },
  },
}
