return {
	"m4xshen/hardtime.nvim",
	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	opts = {
		max_count = 7,
		disabled_keys = {
			["<Up>"] = { "n", "v" },
			["<Down>"] = { "n", "v" },
			["<Left>"] = { "n", "v" },
			["<Right>"] = { "n", "v" },
		},
	},
}
