return {
	"echasnovski/mini.files",
	config = function()
		require("mini.files").setup({
			mappings = {
				go_in_plus = "<CR>",
				close = "<ESC>",
			},
		})
		vim.keymap.set("n", "<leader>EE", "<cmd>lua MiniFiles.open()<CR>")
		vim.keymap.set("n", "<leader>ee", "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0), false)<CR>")
	end,
}
