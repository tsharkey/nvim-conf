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
		golangcilint.append_fname = true -- This is often default
		golangcilint.args = {
			"run",
			"--out-format",
			"json", -- Changed this line
			"--issues-exit-code=0",
			"--show-stats=false", -- This flag is fine
			-- Potentially add other golangci-lint flags you need here
		}
	end,
}
