return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local luasnip = require("luasnip")
		luasnip.setup({
			history = true,
			updateevents = "TextChanged,TextChangedI",
		})

		-- add snippet sources
		require("luasnip/loaders/from_vscode").lazy_load()
		require("tsharkey.snippets")
	end,
}
