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
            --         dismiss = "<Esc>",
            --     },
            -- },
            filetypes = {
                markdown = false,
                help = false,
                sh = function ()
                    if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
                        return false
                    end

                    return true
                end,
            },
        },
    },
}
