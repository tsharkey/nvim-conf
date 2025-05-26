return {
  { 
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup({
          ui = {
              icons = {
                  package_installed = "✓",
                  package_pending = "➜",
                  package_uninstalled = "✗"
              }
          }
      })
    end
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

      local lspconfig = require('lspconfig')
      lspconfig.graphql.setup({
        filetypes = { "graphql", "gql", "graphqls", "typescript", "javascript" },
        root_dir = lspconfig.util.root_pattern('.graphqlrc*', '.graphql.config.*', 'graphql.config.*', 'gqlgen.yml'),
      })

      require("tsharkey.lsp_configs.luals").setup(on_attach, capabilities)
      require("tsharkey.lsp_configs.solargraph").setup(on_attach, capabilities)
      require("tsharkey.lsp_configs.golangci_lint").setup(on_attach, capabilities)
      require("tsharkey.lsp_configs.gopls").setup(on_attach, capabilities)
      require("tsharkey.lsp_configs.html").setup(on_attach, capabilities)
      require("tsharkey.lsp_configs.tailwindcss").setup(on_attach, capabilities)
      require("tsharkey.lsp_configs.templ").setup(on_attach, capabilities)
		end,
	},
}
