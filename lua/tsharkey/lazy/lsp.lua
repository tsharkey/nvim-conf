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
			local solargraph_cmd = "/Users/thomassharkey/.rbenv/shims/solargraph"
      local lspconfig = require("lspconfig")
			local root_dir = lspconfig.util.root_pattern("Gemfile", ".git", ".")
			lspconfig.solargraph.setup({
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)
				end,
				capabilities = capabilities,
				cmd = { solargraph_cmd, "stdio" },
				root_dir = root_dir,
				settings = {
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
					}
				},
				flags = {
					debounce_text_changes = 150,
				},
			})
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
				},
        handlers = {
          function(server_name)
          	require("lspconfig")[server_name].setup({
              on_attach = on_attach,
              capabilities = capabilities,
            })
          end,
          ["html"] = require("tsharkey.lsp_configs.html").mason_setup(on_attach, capabilities),
          ["gopls"] = require("tsharkey.lsp_configs.gopls").mason_setup(on_attach, capabilities),
          ["lua_ls"] = require("tsharkey.lsp_configs.luals").mason_setup(on_attach, capabilities),
          ["golangci_lint_ls"] = require("tsharkey.lsp_configs.golangci_lint").mason_setup(
            on_attach,
            capabilities
          ),
          ["templ"] = require("tsharkey.lsp_configs.templ").mason_setup(on_attach, capabilities),
          ["tailwindcss"] = require("tsharkey.lsp_configs.tailwindcss").mason_setup(on_attach, capabilities),
        }
			})
		end,
	},
}
