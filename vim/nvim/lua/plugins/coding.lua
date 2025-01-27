return {
    -- auto pairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        opts = {
            disable_filetype = { "TelescopePrompt", "spectre_panel" },
            map_c_h = true, -- Map the <C-h> key to delete a pair
            map_c_w = true, -- Map <c-w> to delete a pair if possible
        },
    }
}
