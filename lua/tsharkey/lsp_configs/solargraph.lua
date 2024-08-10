local M = {}

M.solargraph_config = {
	solargraph = {
		useBundler = true,
		bundlerPath = "/Users/thomassharkey/.rbenv/versions/2.7.6/bin/bundle",
		diagnostics = true,
		completion = true,
		hover = true,
		definitions = true,
		references = true,
		documentSymbol = true,
		workspaceSymbol = true,
		codeAction = true,
		signature_help = true,
		codeLens = true,
		rename = true,
		formatting = true,
	},
}

function M.mason_setup(on_attach, capabilities)
	return function()
		local lspconfig = require("lspconfig")
		lspconfig.solargraph.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "/Users/thomassharkey/.rbenv/versions/2.7.6/bin/solargraph", "stdio" },
			root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git", "."),
			settings = M.solargraph_config,
		})
	end
end

return M
