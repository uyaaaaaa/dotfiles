return {
    -- blade-nav(laravel,php)
    {
        "ricardoramirezr/blade-nav.nvim",
        ft = { "blade", "php" },
        dependencies = {
            "hrsh7th/nvim-cmp",
        },
        opts = {
            cmp_close_tag = true,
            close_tag_on_complete = true,
        },
    },
}
