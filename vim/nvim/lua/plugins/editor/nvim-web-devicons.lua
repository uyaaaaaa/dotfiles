local icons = require("config.constants.icons")

return {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
        require("nvim-web-devicons").set_icon({
            ["blade.php"] = {
                icon = icons.blade,
                color = "#f9322c",
                cterm_color = "Red",
                name = "Blade",
            },
        })
    end,
}
