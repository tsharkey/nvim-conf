return {
	"github/copilot.vim",
	config = function()
		vim.keymap.set("n", "<leader>oo", "<cmd>Copilot enable<cr>", { silent = true })
		vim.keymap.set("n", "<leader>op", "<cmd>Copilot disable<cr>", { silent = true })

		vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})
		vim.g.copilot_no_tab_map = true
	end,
	keys = {
		{ "<leader>cop", "<cmd>Copilot<cr>", desc = "Copilot" },
	},
}
