vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Delete without overwriting the clipboard
vim.keymap.set({ "n", "v" }, "d", '"_d')
vim.keymap.set({ "n", "v" }, "D", '"_D')

-- Change without overwriting the clipboard
vim.keymap.set({ "n", "v" }, "c", '"_c')
vim.keymap.set({ "n", "v" }, "C", '"_C')

-- when in visual mode if you don't have these
-- it will only indent once, this allows you to
-- repeat the indentation without losing the context
-- of what is highlighted
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- old habits die hard
vim.keymap.set("n", "<C-a>", "ggVG")
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")

vim.keymap.set(
	"n",
	"<leader>gtl",
	"<cmd>lua require('tsharkey.lib.git').git_browse_current_file()<cr>",
	{ noremap = true, silent = true }
)

vim.keymap.set("n", "<leader>ss", "<cmd>Telescope grep_string<cr>")
