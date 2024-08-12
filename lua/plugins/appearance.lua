return {
  {
    "ribru17/bamboo.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("bamboo").setup({
        highlights = {
          ["@comment"] = { fg = "$grey" },
        },
      })
      require("bamboo").load()
    end,
  },
  -- {
  -- "catppuccin/nvim",
  -- name = "catppuccin",
  -- priority = 1000,
  -- config = function()
  -- require("catppuccin").setup({
  -- flavour = "mocha",
  -- transparent_background = true,
  -- })
  -- end,
  -- },
  -- {
  -- "LazyVim/LazyVim",
  -- opts = {
  -- colorscheme = "catppuccin",
  -- },
  -- },
}
