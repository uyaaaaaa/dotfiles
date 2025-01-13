return {
  "nvim-lualine/lualine.nvim",
  opts = {
    disabled_filetypes = {
      status_line = {},
      winbar = {
        "help",
        "dashboard",
        "neo-tree",
        "Trouble",
        "toggleterm",
      },
    },
    options = {
      component_separators = { left = "", right = "<" },
    },
    sections = {
      lualine_c = {},
    },
    winbar = {
      lualine_c = {
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        {
          function()
            local path = vim.fn.expand("%:p")

            if path == "" then
              return ""
            end

            local root = LazyVim.root.get({ normalize = true })
            local cwd = LazyVim.root.cwd()

            if path:find(cwd, 1, true) == 1 then
              path = path:sub(#cwd + 2)
            else
              path = path:sub(#root + 2)
            end

            local sep = " > "
            local parts = vim.split(path, "[\\/]")

            local dir = ""
            if #parts > 1 then
              dir = table.concat({ unpack(parts, 1, #parts - 1) }, sep)
              dir = LazyVim.lualine.format(LazyVim.lualine.pretty_path(), dir .. sep, "")
            end

            if #parts > 3 then
              parts = { parts[1], "…", table.concat({ unpack(parts, #parts - 1, #parts) }, sep) }
            end

            return dir .. vim.fn.expand("%:t")
          end,
        },
        {
          function()
            local navic = require("nvim-navic")
            navic.setup({
              icons = {
                Variable = nil,
              },
            })

            return navic.get_location({
              separator = " > ",
              depth_limit = 3,
              safe_output = true,
              highlight = true,
            })
          end,
        },
      },
    },
  },
}
