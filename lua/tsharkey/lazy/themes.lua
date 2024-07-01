return {
	{
		"EdenEast/nightfox.nvim",
		config = function()
			-- vim.cmd("colorscheme nordfox")
			-- vim.cmd("colorscheme nightfox")
			vim.cmd("colorscheme terafox")
		end,
	},
	{
		"shaunsingh/nord.nvim",
		lazy = true,
		name = "nord",
		config = function()
			vim.cmd("colorscheme nord")
		end,
	},
}
