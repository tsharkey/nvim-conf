return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup()

		vim.keymap.set("n", "<leader>glb", "<cmd>Gitsigns toggle_current_line_blame<cr>")
		vim.keymap.set("n", "<leader>gc", "<cmd>Gitsigns preview_hunk<cr>")
		vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame<cr>")
		vim.keymap.set("n", "<leader>gj", "<cmd>Gitsigns next_hunk<cr>")
		vim.keymap.set("n", "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>")
		vim.keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>")
	end,
}
