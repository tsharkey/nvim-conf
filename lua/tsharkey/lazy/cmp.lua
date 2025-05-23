return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
		"windwp/nvim-autopairs",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"luckasRanarison/tailwind-tools.nvim",
		"onsails/lspkind-nvim",
	},
	opts = function()
		return {
			formatting = {
				format = require("lspkind").cmp_format({
					before = require("tailwind-tools.cmp").lspkind_format,
				}),
			},
		}
	end,
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		require("tsharkey.snippets.go")
		require("tsharkey.snippets.templ")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		cmp.setup({
      window = {
        completion = {
          border = 'rounded',
          scrollbar = '║',
        },
        documentation = {
          border = nil,
          scrollbar = ''
        }
      },
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
			cmp.setup.filetype("minifiles", { sources = cmp.config.sources({}, {}) }),
		})

		-- Integrate nvim-autopairs with nvim-cmp
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
