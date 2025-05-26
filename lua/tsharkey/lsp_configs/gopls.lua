local M = {}

M.gopls_config = {
	gopls = {
		gofumpt = true,
		codelenses = {
			gc_details = false,
			generate = true,
			regenerate_cgo = true,
			run_govulncheck = true,
			test = true,
			tidy = true,
			upgrade_dependency = true,
			vendor = true,
		},
		hints = {
			assignVariableTypes = true,
			compositeLiteralFields = true,
			compositeLiteralTypes = true,
			constantValues = true,
			functionTypeParameters = true,
			parameterNames = true,
			rangeVariableTypes = true,
		},
		analyses = {
			fieldalignment = true,
			nilness = true,
			unusedparams = true,
			unusedwrite = true,
			useany = true,
			fillstruct = true,
		},
		usePlaceholders = true,
		completeUnimported = true,
		staticcheck = true,
		directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
		semanticTokens = true,
	},
}

function M.setup(on_attach, capabilities)
  local lspconfig = require("lspconfig")
  lspconfig.gopls.setup({
    on_attach = on_attach,
    filetypes = {"go"},
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
    settings = M.gopls_config,
  })
end

return M
