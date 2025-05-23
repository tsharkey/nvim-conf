local M = {}

function M.mason_setup(on_attach, capabilities)
	return function()
		local lspconfig = require("lspconfig")
		lspconfig.golangci_lint_ls.setup({
			filetypes = { "go" },
			cmd = { "golangci-lint-langserver" },
			root_dir = require("lspconfig").util.root_pattern(".git", "go.mod"),
			init_options = {
				command = {
					"golangci-lint",
					"run",
					"--disable",
					"lll",
					"--out-format",
					"json",
					"--issues-exit-code=1",
				},
			},
		})
	end
end

return M
