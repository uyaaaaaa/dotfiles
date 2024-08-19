if false then
  return {
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
  }
else
  return {}
end
