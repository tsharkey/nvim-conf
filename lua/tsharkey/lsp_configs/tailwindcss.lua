local M = {}

M.old_config = {
	init_options = { userLanguages = { templ = "html" } },
}

M.tailwind_config = {
	classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
	includeLanguages = {
		eelixir = "html-eex",
		eruby = "erb",
		htmlangular = "html",
		templ = "html",
	},
	lint = {
		cssConflict = "warning",
		invalidApply = "error",
		invalidConfigPath = "error",
		invalidScreen = "error",
		invalidTailwindDirective = "error",
		invalidVariant = "error",
		recommendedVariantOrder = "warning",
	},
	validate = true,
}

function M.mason_setup(on_attach, capabilities)
	return function()
		local lspconfig = require("lspconfig")
		lspconfig.tailwindcss.setup({
			on_attach = on_attach,
			filetypes = { "html", "templ" },
			root_dir = lspconfig.util.root_pattern(".git", "go.mod", "tailwind.config.js"),
			capabilities = capabilities,
			settings = {
				tailwindCSS = M.tailwind_config,
			},
		})
	end
end

return M
