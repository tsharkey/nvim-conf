local M = {}

function M.mason_setup(on_attach, capabilities)
	return function()
		local lspconfig = require("lspconfig")
		lspconfig.templ.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "templ" },
			cmd = { "templ", "lsp" },
			root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
		})
	end
end

return M
