return {
	"mfussenegger/nvim-lint",
	config = function()
		vim.g.lint_debug = true
		require("lint").linters_by_ft = {
			astro = { "eslint" },
			go = { "golangcilint" },
			javascript = { "eslint" },
			typescript = { "eslint" },
		}
	end,
}
