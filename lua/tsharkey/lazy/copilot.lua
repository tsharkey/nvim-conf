return {
	"github/copilot.vim",
	config = function()
		vim.keymap.set("n", "<leader>oo", "<cmd>Copilot enable<cr>", { silent = true })
		vim.keymap.set("n", "<leader>op", "<cmd>Copilot disable<cr>", { silent = true })
	end,
}
