return {
	"github/copilot.vim",
	config = function()
		vim.cmd(":Copilot disable")
		-- vim.keymap.set({"i", "n"}, "<C-h>", "<cmd>Copilot enable<cr>", { silent = true })
		-- vim.keymap.set({"i", "n"}, "<C-l>", "<cmd>Copilot disable<cr>", { silent = true })
	end,
}
