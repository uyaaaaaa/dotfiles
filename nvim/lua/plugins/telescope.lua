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
