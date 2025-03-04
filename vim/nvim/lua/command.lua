-- Setup Custom Commands
local command = vim.api.nvim_create_user_command

local function get_snippet_path(ft)
    return vim.fn.expand("~/.config/nvim/lua/snippets/" .. ft .. ".lua")
end

local function edit_snippet()
    local ft = vim.bo.filetype
    local snippet_path = get_snippet_path(ft)

    vim.cmd("edit " .. snippet_path)
end

command("SnipEdit", edit_snippet, { desc = "Edit snippet" })
command("Fm", function() vim.lsp.buf.format() end, { desc = "Save with format" })
