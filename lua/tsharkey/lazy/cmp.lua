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
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		cmp.setup({
      window = {
        completion = {
          border = 'rounded',
          scrollbar = '║',
        },
        documentation = {
          border = 'rounded',
          scrollbar = ''
        }
      },
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
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
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "buffer" },
			},
			cmp.setup.filetype("minifiles", { sources = cmp.config.sources({}, {}) }),
		})

		-- Integrate nvim-autopairs with nvim-cmp
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
