-- only vim specific keybinds are in here
-- plugin keybinds are in their respective config blocks

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Explorer/File Tree
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-------------------------------------------------------
-- General coding QOL
-------------------------------------------------------

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
vim.keymap.set("n", "<C-a>", "ggVG")

vim.keymap.set("n", "<leader>bb", "<cmd>buffers +<CR>")

vim.keymap.set("n", "<leader>ww", "<C-w>w")
vim.keymap.set("n", "<leader>wv", "<C-w>v")

local function git_browse_current_file()
	print("Function called") -- Debug print statement
	local file_path = vim.fn.expand("%")
	local cmd = "gh browse " .. file_path
	vim.cmd("!" .. cmd)
end

-- Map <leader>go to the function
vim.keymap.set("n", "<leader>go", git_browse_current_file, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>jj", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })
