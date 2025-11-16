---@class core.util
local M = {}

-- remap `gd`
function M.GD()
    local cfile = vim.fn.expand("<cfile>")

    if cfile:match("^https?://") then
        vim.ui.open(cfile)
    else
        Snacks.picker.lsp_definitions()
    end
end

function M.ToggleCsvFormat()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    -- remove blank lines
    local non_empty_lines = vim.tbl_filter(function(line)
        return line:match("%S")
    end, lines)

    -- split to vertical if only camma separated line
    if #non_empty_lines == 1 and string.match(non_empty_lines[1], "([^,]+)") then
        local parts = vim.split(non_empty_lines[1], ",%s*")
        vim.api.nvim_buf_set_lines(0, 0, -1, false, parts)
        return
    end

    -- marge to camma separated line if not has camma
    for _, line in ipairs(non_empty_lines) do
        if line:find(",") then
            return
        end
    end

    local marged = table.concat(non_empty_lines, ", ")
    vim.api.nvim_buf_set_lines(0, 0, -1, false, { marged })
end

local clipboard_register = (vim.fn.has("linux") == 1 or vim.fn.has("unix") == 1) and "+" or "*"

function M.InsertMarkdownLink()
    local old = vim.fn.getreg("z")

    local link = vim.fn.trim(vim.fn.getreg(clipboard_register))

    if not link:match("^http.*") then
        vim.api.nvim_feedkeys("P", "n", false)
        return
    end

    -- Yank selected area to `z` register.
    vim.cmd('normal! gV"zy')
    local word = vim.fn.getreg("z")

    -- Create link string.
    local new_text = string.format("[%s](%s)", word, link)
    -- Set new text to `z` register.
    vim.fn.setreg("z", new_text)

    -- Put `z` register to selected area
    vim.cmd('normal! gv"zP')

    -- Recover old register
    vim.fn.setreg("z", old)
end

return M
