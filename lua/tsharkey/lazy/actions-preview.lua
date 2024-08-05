return {
	"aznhe21/actions-preview.nvim",
	config = function()
		vim.keymap.set({ "n", "v" }, "<leader>ap", require("actions-preview").code_actions)
	end,
}
