return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup()

		vim.keymap.set("n", "<leader>glb", "<cmd>Gitsigns toggle_current_line_blame<cr>")
		vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns preview_hunk<cr>")
		vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame<cr>")
	end,
}
