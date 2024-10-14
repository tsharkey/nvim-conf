return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports" },
				sql = { "pg_format" },
				yaml = { "yamlfix" },
				graphql = { "prettier" },
				templ = { "templ" },
				ruby = { "rufo" },
				terraform = { "terraform_fmt" },
			},
		})
	end,
	opts = {},
}
