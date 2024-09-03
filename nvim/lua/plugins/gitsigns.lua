return {
  "lewis6991/gitsigns.nvim",
  opts = {
    attach_to_untracked = true,
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 500,
      virt_text_pos = "eol",
    },
    on_attach = function()
      local keymap = require("vim.keymap")
      local gitsigns = require("gitsigns")
      keymap.set(
        "n",
        "<leader>dd",
        gitsigns.preview_hunk_inline,
        { desc = "Preview diff", noremap = true, silent = true }
      )
      keymap.set("n", "gn", gitsigns.next_hunk, { desc = "Move to next hunk", noremap = true, silent = true })
      keymap.set("n", "gb", gitsigns.prev_hunk, { desc = "Move to prev hunk", noremap = true, silent = true })
    end,
  },
}
