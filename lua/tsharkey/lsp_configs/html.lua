local M = {}

function M.mason_setup(on_attach, capabilities)
	return function()
		require("lspconfig").html.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "html", "templ", "jsx" },
			init_options = {
				configurationSection = { "html", "css", "javascript", "templ" },
				embeddedLanguages = {
					css = true,
					javascript = true,
					templ = true,
				},
				provideFormatter = true,
			},
		})
	end
end

return M
