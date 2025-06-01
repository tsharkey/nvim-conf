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
				typescript = { "prettier", "eslint_d" },
				javascript = { "prettier" , "eslint_d" },
				javascriptreact = { "prettier", "eslint_d"  },
				typescriptreact = { "prettier", "eslint_d"  },
				terraform = { "terraform_fmt" },
				xml = { "xmlstarlet" },
				astro = { "prettier", "eslint_d"  },
				sh = { "shellcheck" },
				json = { "jq", "prettier", "jsonlint" },
			},
		})
	end,
	opts = {},
}
