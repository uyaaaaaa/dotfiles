return {
    -- blink.cmp
    {
        "saghen/blink.cmp",
        dependencies = { "L3MON4D3/LuaSnip" },
        version = "*",
        event = { "InsertEnter", "CmdLineEnter" },
        opts = {
            completion = {
                trigger = { show_on_keyword = true },
                menu = {
                    border = "rounded",
                    draw = {
                        align_to = "cursor",
                        treesitter = { "lsp" },
                    },
                    winblend = 10,
                    auto_show = function(ctx)
                        -- Disable in cmdline for SEARCH mode('/' or '?')
                        return ctx.mode ~= "cmdline" or not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
                    end,
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                    window = { border = "rounded" },
                },
            },
            snippets = { preset = "luasnip" },
            keymap = {
                preset = "enter",
                ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
                ["<C-j>"] = { "select_next", "fallback_to_mappings" },
                ["<C-b>"] = { function(cmp) cmp.scroll_documentation_up(2) end },
                ["<C-f>"] = { function(cmp) cmp.scroll_documentation_down(2) end },
                ["<Esc>"] = { "hide", "fallback" },
                ["<Tab>"] = {
                    function(cmp)
                        if cmp.snippet_active() then
                            require("copilot.suggestion").clear_preview()
                            return cmp.accept()
                        end
                        if (require("copilot.suggestion").is_visible()) then
                            return require("copilot.suggestion").accept()
                        end
                        return cmp.select_and_accept()
                    end,
                    "snippet_forward",
                    "fallback",
                }
            },
            cmdline = {
                keymap = {
                    ["<CR>"] = { "accept_and_enter", "fallback" },
                },
            },
            sources = {
                default = { "snippets", "lsp", "path", "buffer" },
                per_filetype = {
                    markdown = { "snippets", "lsp", "path" },
                    mdx = { "snippets", "lsp", "path" },
                    php = { "snippets", "laravel", "lsp", "path", "buffer" },
                },
                providers = {
                    laravel = {
                        name = "laravel",
                        module = "laravel.blink_source",
                    },
                },
                min_keyword_length = function(ctx)
                    -- Enable completion over 3 characters for command line mode
                    if ctx.mode == "cmdline" and ctx.line:find("^%l+$") ~= nil then
                        return 3
                    end
                    return 0
                end,
            },
        },
        opts_extend = { "sources.default" },
    },

    -- LuaSnip
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        lazy = true,
        version = "v2.*",
        build = "make install_jsregexp",
        config = function()
            require("luasnip.loaders.from_lua").load({
                paths = "~/.config/nvim/lua/snippets/"
            })
        end,
    },
}
