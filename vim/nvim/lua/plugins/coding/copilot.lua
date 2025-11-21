return {
    "zbirenbaum/copilot.lua",
    dependencies = {
        "copilotlsp-nvim/copilot-lsp",
    },
    build = ":Copilot auth",
    lazy = true,
    keys = {
        { "tt", mode = { "n", "v" }, function() return require("copilot.suggestion").toggle_auto_trigger() end, desc = "Toggle copilot" },
    },
    opts = {
        suggestion = {
            enabled = true,
            auto_trigger = true,
            keymap = {
                accept = "<Tab>",
                accept_line = "<C-l>",
                next = "<C-]>",
                prev = "<C-[>",
                dismiss = "<C-e>",
            },
        },
        -- nes = {
        --     enabled = true,
        --     auto_trigger = true,
        --     keymap = {
        --         accept_and_goto = "<C-CR>",
        --         accept = false,
        --         dismiss = "<C-e>",
        --     },
        -- },
        filetypes = {
            markdown = false,
            help = false,
        },
        should_attach = function(_, bufname)
            if string.match(bufname, "env") then
                return false
            end
            return true
        end
    },
}
