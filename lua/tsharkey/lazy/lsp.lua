return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"astro-language-server",
					"bash-language-server",
					"eslint-lsp",
					"gopls",
					"html-lsp",
					"jq",
					"jsonlint",
					"lua-language-server",
					"prettier",
					"shellcheck",
					"stylua",
					"tailwindcss-language-server",
					"terraform",
					"terraform-ls",
					"typescript-language-server",
				},
			})
		end,
	},
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

			vim.lsp.config("*", {
				on_attach = on_attach,
				capabilities = capabilities,
			})

			vim.lsp.enable({
				"lua_ls",
				"astro",
				"tailwindcss",
				"bashls",
				"html",
				"gopls",
				"ts_ls",
				"eslint",
				"terraformls",
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = {
								"vim",
								"require",
							},
						},
					},
				},
			})
		end,
	},
}
