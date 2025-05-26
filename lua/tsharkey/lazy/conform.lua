return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "gofmt" },
				sql = { "pg_format" },
				graphql = { "prettierd" },
				templ = { "templ" },
				ruby = { "rufo" },
        typescript = { "eslint_d", "prettierd" },
        javascript = { "eslint_d", "prettierd" },
        javascriptreact = { "eslint_d", "prettierd" },
        typescriptreact = { "eslint_d", "prettierd" },
        terraform = { "terraform_fmt" },
        xml = { "xmlstarlet" },
			},
		})
	end,
	opts = {},
}
