return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    opts = {
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        routes = {
            {
                view = "mini",
                filter = {
                    event = "notify",
                    kind = "info",
                    cond = function(message)
                        return message.opts and message.opts.title and message.opts.title:find("Auto Save")
                    end,
                },
            },
        },
        presets = {
            command_palette = true,
            lsp_doc_border = true,
        },
    },
    config = function(_, opts)
        local filters = {
            { "msg_show", "%d+L, %d+B" },
            { "msg_show", "; after #%d+" },
            { "msg_show", "; before #%d+" },
            { "msg_show", "more lines" },
            { "msg_show", "fewer lines" },
            { "msg_show", "No information available" },
            { "msg_show", "1 time" },
            { "msg_show", "Cannot write, \'buftype\' option is set" },
            { "notify",   "hover is not supported by the servers of the current buffer" },
            { "notify",   "No information available" },
            { "notify",   "vim.ui.open: command timeout " },
        }

        local function noiceWrapper(event, pattern)
            return {
                filter = {
                    event = event,
                    find = pattern,
                },
            }
        end

        for _, values in pairs(filters) do
            table.insert(opts.routes, noiceWrapper(values[1], values[2]))
        end

        require("noice").setup(opts)
    end,
}
