return {
	"github/copilot.vim",
	config = function()
		vim.g.copilot_no_tab_map = true
		vim.api.nvim_set_keymap("i", "<C-;>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
		vim.api.nvim_set_keymap("n", "<leader>cpd", ":Copilot disable<CR>", { silent = true })
		vim.api.nvim_set_keymap("n", "<leader>cpe", ":Copilot enable<CR>", { silent = true })
	end,
}
