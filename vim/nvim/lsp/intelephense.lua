return {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php", "php_only", "blade" },
    root_markers = { "composer.json", ".git" },
    settings = {
        intelephense = {
            files = {
                maxSize = 5000000,
                associations = {
                    "*.php",
                },
                exclude = {
                    "./storage",
                    "./bootstrap/cache",
                    "./node_modules",
                    "./vendor/**/tests",
                },
            },
            environment = {
                includePaths = {
                    "./_ide_helper.php",
                    "./_ide_helper_models.php",
                },
            },
        },
    },
}
