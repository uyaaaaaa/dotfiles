-- @see https://github.com/kylechui/nvim-surround?tab=readme-ov-file README.md
-- ys<motion><delimiter>: you surround/add
-- ds<delimiter>: delete surrounding
-- cs<old><new>: change surrounding
-- In HTML, motion 't' makes tag target.
return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({})
  end,
}
