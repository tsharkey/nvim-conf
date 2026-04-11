return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			{
				"nvim-treesitter/nvim-treesitter", -- Optional, but recommended
				branch = "main", -- NOTE; not the master branch!
				build = function()
					vim.cmd(":TSUpdate go")
				end,
			},
			{
				"fredrikaverpil/neotest-golang",
				version = "*", -- Optional, but recommended; track releases
				build = function()
					vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
				end,
			},
		},
		config = function()
			local config = {
				runner = "gotestsum", -- Optional, but recommended
				warn_test_name_dupes = false,
			}
			require("neotest").setup({
				adapters = {
					require("neotest-golang")(config),
				},
			})
		end,
		keys = {
			{
				"<leader>tt",
				function()
					require("neotest").run.run()
				end,
				desc = "Run Nearest Test",
			},
			{
				"<leader>tf",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Run File Tests",
			},
			{
				"<leader>ts",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "Toggle Test Summary",
			},
		},
	},
}
