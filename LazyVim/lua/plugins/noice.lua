return {
  "folke/noice.nvim",
  keys = {
    {
      "<s-j>",
      function()
        require("noice.lsp").scroll(4)
      end,
      desc = "Scroll Forward",
    },
    {
      "<s-k>",
      function()
        require("noice.lsp").scroll(-4)
      end,
      desc = "Scroll Backward",
    },
  },
  opts = function(_, opts)
    table.insert(opts.routes, {
      filter = {
        event = "notify",
        find = "No information available",
      },
      opts = { skip = true },
    })
  end,
  config = function()
    require("noice").setup({
      presets = { lsp_doc_border = true },
    })
  end,
}
