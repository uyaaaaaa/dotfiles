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
      winblend = 40,
      dynamic_preview_title = true,
      cache_picker = {
        num_pickers = 10,
      },
    },
  },
}
