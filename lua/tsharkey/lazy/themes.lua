return {
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	config = function()
	-- 		vim.cmd("colorscheme nordfox")
	-- 		-- vim.cmd("colorscheme nightfox")
	-- 		-- vim.cmd("colorscheme terafox")
	-- 	end,
	-- },
	-- {
	-- 	"cocopon/iceberg.vim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd("colorscheme iceberg")
	-- 	end,
	-- },
	-- {
	-- 	"AlexvZyl/nordic.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("nordic").load()
	-- 	end,
	-- },
	-- {
	-- 	"shaunsingh/nord.nvim",
	-- 	lazy = true,
	-- 	name = "nord",
	-- 	config = function()
	-- 		vim.cmd("colorscheme nord")
	-- 	end,
	-- },
	-- {
	-- 	"uloco/bluloco.nvim",
	-- 	dependencies = { "rktjmp/lush.nvim" },
	-- 	config = function()
	-- 		-- vim.cmd("colorscheme bluloco-dark")
	-- 	end,
	-- },
	-- {
	-- 	"oxfist/night-owl.nvim",
	-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		-- load the colorscheme here
	-- 		require("night-owl").setup()
	-- 		vim.cmd.colorscheme("night-owl")
	-- 	end,
	-- },
	-- {
	-- 	"atmosuwiryo/vim-winteriscoming",
	-- 	name = "winteriscoming",
	-- 	config = function()
	-- 		vim.cmd.colorscheme("WinterIsComing-dark-blue-color-theme")
	-- 	end,
	-- },
	{
		"shaunsingh/moonlight.nvim",
		lazy = false,
		config = function()
			vim.cmd.colorscheme("moonlight")
		end,
	},
}
