-- Setup Custom Commands
local command = vim.api.nvim_create_user_command

command("Fm", function() vim.lsp.buf.format() end, { desc = "Save with format" })
