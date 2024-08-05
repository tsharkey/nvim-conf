return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "gofmt" },
				sql = { "pg_format" },
				yaml = { "yamlfix" },
				graphql = { "prettier" },
				templ = { "templ" },
				ruby = { "rufo" },
				terraform = { "terraform_fmt" },
			},
		})
	end,
	format_on_save = {
		enabled = true,
		timeout_ms = 500,
	},
	opts = {},
}
