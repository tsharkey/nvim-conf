return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			astro = { "eslint" },
			go = { "golangcilint" },
			javascript = { "eslint" },
			typescript = { "eslint" },
		}
		local golangcilint = require("lint.linters.golangcilint")
		golangcilint.append_fname = true
		golangcilint.args = {
			"run",
			"--output.json.path",
			"stdout",
			"--issues-exit-code=0",
			"--show-stats=false",
		}
	end,
}
