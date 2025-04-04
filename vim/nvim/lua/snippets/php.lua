local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("php", {
    -- todo comment
    s("todo", { t("// TODO: "), i(1, "desc") }),
    -- laravel log(info)
    s("lg", { t("\\Log::info(\""), i(1, "title"), t(": \" "), i(2), t(");") }),
    -- function
    s("fn", {
        t("/**"),
        t({ "", " * " }), i(1, "desc"),
        t({ "", " */" }),
        t({ "", "public function " }), i(2, "fnName"), t("(): "), i(3, "void"),
        t({ "", "{", "    " }),
        i(0),
        t({ "", "}", "" }),
    }),
    -- phpdoc
    s("doc", {
        t("/**"),
        t({ "", " * " }), i(1, "desc"),
        t({ "", " */" }),
        i(0),
    }),
    -- return value
    s("return", { t("return "), i(1), t(";") }),
})

