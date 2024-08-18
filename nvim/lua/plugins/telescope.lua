local keymap = require("vim.keymap")
local builtin = require("telescope.builtin")

keymap.set("n", "<C-p>", builtin.find_files, {})
keymap.set("n", "ff", builtin.live_grep, {})
keymap.set("v", "ff", builtin.grep_string, {})
keymap.set({ "n", "v" }, "cc", builtin.command_history, {})
keymap.set({ "n", "v" }, "<C-g>c", builtin.git_commits, { desc = "Git Commit Logs" })
keymap.set({ "n", "v" }, "<C-g>s", builtin.git_status, { desc = "Git Status" })
keymap.set({ "n", "v" }, "<C-g>b", builtin.git_branches, { desc = "Git Branch" })

return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
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
  },
}
