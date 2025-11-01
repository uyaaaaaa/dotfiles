return {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php", "php_only", "blade" },
    root_markers = { "composer.json", ".git" },
    settings = {
        intelephense = {
            files = {
                associations = {
                    "*.php",
                },
                includePaths = {
                    "./_ide_helper.php",
                    "./_ide_helper_models.php",
                },
            },
        },
    },
}
