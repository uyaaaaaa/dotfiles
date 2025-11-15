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

local function changeIndent(args)
    local indent = tonumber(args)

    vim.bo.shiftwidth = indent
    vim.bo.softtabstop = indent
    vim.bo.tabstop = indent
end

command("SnipEdit", edit_snippet, { desc = "Edit snippet" })
command("Fm", function() vim.lsp.buf.format() end, { desc = "Format" })
command("Indent", function(opts) changeIndent(opts.args) end, { nargs = 1, desc = "Change indent" })
command("Color", function(opts) Snacks.picker.colorschemes() end, { desc = "Choose colorschemes" })
