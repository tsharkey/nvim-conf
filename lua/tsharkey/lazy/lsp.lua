return {
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"RRethy/nvim-treesitter-endwise",
		config = function()
			require("nvim-treesitter.configs").setup({
				endwise = {
					enable = true,
				},
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"windwp/nvim-autopairs",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("tsharkey.snippets.go")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete({}),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "buffer" },
				},
			})

			-- Integrate nvim-autopairs with nvim-cmp
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = true },
		},
		config = function()
			require("lspconfig").gopls.setup({
				settings = {
					gopls = {
						gofumpt = true,
						codelenses = {
							gc_details = false,
							generate = true,
							regenerate_cgo = true,
							run_govulncheck = true,
							test = true,
							tidy = true,
							upgrade_dependency = true,
							vendor = true,
						},
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
						analyses = {
							fieldalignment = true,
							nilness = true,
							unusedparams = true,
							unusedwrite = true,
							useany = true,
							fillstruct = true,
						},
						usePlaceholders = true,
						completeUnimported = true,
						staticcheck = true,
						directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
						semanticTokens = true,
					},
				},
			})

			local on_attach = function(_, bufnr)
				vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = bufnr })
				vim.keymap.set("n", "<leader>cc", vim.lsp.buf.code_action, { buffer = bufnr })

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
				vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = bufnr })
				vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { buffer = bufnr })

				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
				vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr })
				vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
					vim.lsp.buf.format()
				end, {})
			end
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
			vim.g.ruby_host_prog = "/Users/thomassharkey/.rbenv/versions/2.7.6/bin/ruby"
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"golangci_lint_ls",
					"templ",
					-- "htmx",
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
				["solargraph"] = function()
					require("lspconfig").solargraph.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						cmd = { "/Users/thomassharkey/.rbenv/versions/2.7.6/bin/solargraph", "stdio" },
						root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git", "."),
						settings = {
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
								codeLens = true,
								rename = true,
								formatting = true,
							},
						},
					})
				end,
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						settings = {
							Lua = {
								workspace = { checkThirdParty = false },
								telemetry = { enable = false },
								diagnostics = { globals = { "vim" } },
								hint = { enable = true },
							},
						},
					})
				end,
				["golangci_lint_ls"] = function()
					require("lspconfig").golangci_lint_ls.setup({
						filetypes = { "go", "gomod" },
						cmd = { "golangci-lint-langserver" },
						root_dir = require("lspconfig").util.root_pattern(".git", "go.mod"),
						init_options = {
							command = {
								"golangci-lint",
								"run",
								"--disable",
								"lll",
								"--out-format",
								"json",
								"--issues-exit-code=1",
							},
						},
					})
				end,
				["templ"] = function()
					require("lspconfig").templ.setup({
						filetypes = { "templ" },
						cmd = { "templ", "lsp" },
						root_dir = require("lspconfig").util.root_pattern(".git", "go.mod"),
					})
				end,
				["tailwindcss"] = function()
					require("lspconfig").tailwindcss.setup({
						on_attacnh = on_attach,
						capabilities = capabilities,
						filetypes = { "html", "templ" },
						root_dir = require("lspconfig").util.root_pattern(".git", "go.mod", "tailwind.config.js"),
						init_options = { userLanguages = { templ = "html" } },
					})
				end,
			})
		end,
	},
}
