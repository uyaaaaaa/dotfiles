require("vim.keymap").set("", "<C-w>", LazyVim.ui.bufremove, { desc = "Delete Current Buffer" })

return {
  "akinsho/bufferline.nvim",
  keys = {
    { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next Tab" },
    { "<s-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev Tab" },
  },
  opts = {
    options = {
      show_buffer_close_icons = false,
      show_close_icon = false,
      always_show_bufferline = true,
    },
  },
}
