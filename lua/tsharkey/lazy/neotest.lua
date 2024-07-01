return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- "fredrikaverpil/neotest-golang", -- Installation
			"nvim-neotest/neotest-go",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-go"), -- Registration
				},
				output = { open_on_run = true },
			})
		end,
		keys = {
			{
				"<leader>td",
				function()
					require("neotest").run.run({ suite = false, strategy = "dap" })
				end,
				desc = "Debug the nearest test",
			},
			{
				"<leader>tt",
				function()
					require("neotest").run.run()
				end,
				desc = "Run the nearest test",
			},
			{
				"<leader>tf",
				function()
					require("neotest").run.run({ vim.fn.expand("%") })
				end,
				desc = "Run the current file's tests",
			},
			{
				"<leader>to",
				function()
					require("neotest").output_panel.toggle()
				end,
				desc = "Show the test output panel",
			},
		},
	},
}
