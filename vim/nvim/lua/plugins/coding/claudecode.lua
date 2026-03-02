-- lua/plugins/claudecode.lua
return {
    "coder/claudecode.nvim",
    event = "BufRead",
    opts = {
        terminal_cmd = "/opt/homebrew/bin/claude --ide",
        auto_start = true,
        terminal = {
            provider = "none",
        },
        diff_opts = {
            open_in_new_tab = true,
        },
    },
    keys = {
        { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer to Claude" },
        { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude" },
        {
            "<leader>at",
            "<cmd>ClaudeCodeTreeAdd<cr>",
            desc = "Add file from tree explorer",
            ft = { "neo-tree" },
        },
    },
}
