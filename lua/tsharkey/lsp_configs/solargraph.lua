local M = {}

M.solargraph_config = {
	solargraph = {
		useBundler = true,
		bundlerPath = "/Users/thomassharkey/.rbenv/shims/bundler",
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
			on_attach = function(client, bufnr)
        on_attach(client, bufnr)
      end,
			capabilities = capabilities,
			cmd = { "/Users/thomassharkey/.rbenv/shims/solargraph", "stdio" },
			root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git", "."),
			settings = M.solargraph_config,
		})
	end
end

return M
