return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "gofmt", "golangci-lint" },
				sql = { "pg_format" },
				graphql = { "prettier" },
				templ = { "templ" },
				ruby = { "rufo" },
				typescript = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				terraform = { "terraform_fmt" },
				xml = { "xmlstarlet" },
				astro = { "prettier" },
				sh = { "shellcheck" },
				json = { "jq", "prettier", "jsonlint" },
			},
		})
	end,
	opts = {},
}
