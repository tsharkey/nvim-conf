local M = {}

M.lua_ls_config = {
	Lua = {
		workspace = { checkThirdParty = false },
		telemetry = { enable = false },
		diagnostics = { globals = { "vim" } },
		hint = { enable = true },
	},
}

function M.mason_setup(on_attach, capabilities)
	return function()
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = M.lua_ls_config,
		})
	end
end

return M
