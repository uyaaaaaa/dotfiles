local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { import = "plugins.colorscheme" },
        { import = "plugins.editor" },
        { import = "plugins.coding" },
        { import = "plugins.markdown" },
        { import = "plugins.completion" },
        { import = "plugins.lspconfig" },
        { import = "plugins.picker" },
        { import = "plugins.languages" },
    },
    diff = {
        cmd = "terminal_git",
    },
    checker = { enabled = true }, -- automatically check for plugin updates
    change_detection = { notify = false },
})
