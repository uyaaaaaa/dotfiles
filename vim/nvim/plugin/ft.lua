vim.filetype.add({
    filename = {
        [".env*"] = "sh.env",
        ["*.env*"] = "sh.env",
        [".envrc"] = "sh.env",
        ["*.envrc"] = "sh.env",
    },
    pattern = {
        [".*%.blade.%.php"] = "blade",
    },
})

