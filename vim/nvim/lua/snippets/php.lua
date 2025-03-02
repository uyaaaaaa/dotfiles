local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("php", {
    -- todo comment
    s("todo", { t("// TODO: "), i(1, "description") }),
    -- laravel log(info)
    s("lg", { t("\\Log::info(\""), i(1, "title"), t(": \" + "), i(2), t(");") }),
    -- function template
    s("fn", {
        t("public function "), i(1, "fnName"), t("(): "), i(2, "void"),
        t({"", "{", "    "}),
        i(0),
        t({"", "}"})
    })
})

