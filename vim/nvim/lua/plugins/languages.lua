return {
    -- blade-nav(laravel,php)
    -- {
    --     "ricardoramirezr/blade-nav.nvim",
    --     ft = { "blade", "php" },
    --     dependencies = {
    --         "saghen/blink.cmp",
    --     },
    --     opts = {
    --         cmp_close_tag = true,
    --         close_tag_on_complete = true,
    --     },
    -- },

    -- laravel
    {
        "adibhanna/laravel.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
        },
        ft = { "blade", "php" },
    },
}
