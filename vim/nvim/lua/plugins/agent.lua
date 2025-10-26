return {
    -- copilot
    {
        "zbirenbaum/copilot.lua",
        dependencies = {
            "copilotlsp-nvim/copilot-lsp",
        },
        build = ":Copilot auth",
        cmd = "Copilot",
        event = "BufReadPost",
        opts = {
            suggestion = {
                enabled = true,
                auto_trigger = true,
                keymap = {
                    accept = "<Tab>",
                    accept_line = "<C-l>",
                    next = "<C-]>",
                    prev = "<C-[>",
                    dismiss = false,
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
    },
}
