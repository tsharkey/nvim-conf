return {
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = true },
		},
		config = function()
			local ts_builtin = require("telescope.builtin")

			local on_attach = function(_, bufnr)
				vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = bufnr })
				vim.keymap.set("n", "<leader>cc", vim.lsp.buf.code_action, { buffer = bufnr })

				vim.keymap.set("n", "gd", ts_builtin.lsp_definitions, { buffer = bufnr })
				vim.keymap.set("n", "gm", ts_builtin.lsp_implementations, { buffer = bufnr })
				vim.keymap.set("n", "gr", ts_builtin.lsp_references, { buffer = bufnr })
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
				vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr })

				vim.keymap.set("n", "<leader>ii", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end, { desc = "Toggle inlay hints" })
			end

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
			capabilities.workspace = {
				didChangeWatchedFiles = {
					dynamicRegistration = true,
				},
			}

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"golangci_lint_ls",
					"templ",
					-- "htmx", this just fails to download
					"html",
					"tailwindcss",
					"solargraph@0.48.0",
				},
			})
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
				["html"] = require("tsharkey.lsp_configs.html").mason_setup(on_attach, capabilities),
				["gopls"] = require("tsharkey.lsp_configs.gopls").mason_setup(on_attach, capabilities),
				["solargraph"] = require("tsharkey.lsp_configs.solargraph").mason_setup(on_attach, capabilities),
				["lua_ls"] = require("tsharkey.lsp_configs.luals").mason_setup(on_attach, capabilities),
				["golangci_lint_ls"] = require("tsharkey.lsp_configs.golangci_lint").mason_setup(
					on_attach,
					capabilities
				),
				["templ"] = require("tsharkey.lsp_configs.templ").mason_setup(on_attach, capabilities),
				["tailwindcss"] = require("tsharkey.lsp_configs.tailwindcss").mason_setup(on_attach, capabilities),
			})
		end,
	},
}
