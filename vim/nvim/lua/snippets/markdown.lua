local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("markdown", {
    -- url
    s("url", { t("["), i(1, "title"), t("]("), i(2, "url"), t(")") }),
})

