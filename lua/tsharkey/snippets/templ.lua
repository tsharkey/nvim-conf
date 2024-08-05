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

local function create_tag_snippet(tag)
	return s(tag, {
		t({ "<" .. tag .. ">", "" }),
		t("\t"),
		i(0),
		t({ "", "</" .. tag .. ">" }),
	})
end

-- tags
local tags = {
	"div",
	"span",
	"input",
	"button",
	"a",
	"img",
	"form",
	"label",
	"select",
	"option",
	"h1",
	"h2",
	"h3",
	"h4",
	"h5",
	"h6",
	"table",
	"tr",
	"td",
	"th",
	"thead",
	"tbody",
	"tfoot",
	"ul",
	"ol",
	"li",
}

for _, tag in ipairs(tags) do
	ls.add_snippets("templ", {
		create_tag_snippet(tag),
	})
end
