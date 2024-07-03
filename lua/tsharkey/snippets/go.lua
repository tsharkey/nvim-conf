local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local f = ls.function_node

ls.add_snippets("go", {
    s("ss", {
        t("simple golang snippet"),
    }),
})

ls.add_snippets("go", {
    s("tests", {
        t({"package "}), i(1),
        t({"", "", "import ("}),
        t({"", "\t\"testing\""}),
        t({"", "\t\"github.com/golang/mock/gomock\""}),
        t({"", "\t. \"github.com/smartystreets/goconvey/convey\""}),
        t({"", ")"}),
        t({"", "", "func Test"}), i(2), t("_"), i(3), t("(t *testing.T){"),
        t({"", "\tConvey(\""}), i(4), t("\", t, func() {"),
        -- todo: trying to get a choice node for adding gomock controller
        -- c(5, { t({"", "\t\tctrl := gomock.NewController()", "\t\tdefer ctrl.Finish()"}, t(""))}),
        t({"", "\t\tctrl := gomock.NewController(t)", "\t\tdefer ctrl.Finish()", "", "\t\t"}), i(0),
        t({"", "", "\t\tConvey(\"Success\", func() {", ""}),
        t("\t\t\t"),
        t({"", "\t\t})"}),
        t({"", "", "\t\tConvey(\"Failure\", func() {", "", "", "\t\t})", "\t})", "}"}),
    })
})

ls.add_snippets("go", {
    s("convey", {
        t("Convey(\""), i(1), t("\", func() {"),
        t({"", "\t"}), i(0),
        t({"", "})"})
    })
})
