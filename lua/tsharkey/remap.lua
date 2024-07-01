-- only vim specific keybinds are in here
-- plugin keybinds are in their respective config blocks

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Explorer/File Tree
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-------------------------------------------------------
-- General coding QOL
-------------------------------------------------------

-- when in visual mode if you don't have these
-- it will only indent once, this allows you to
-- repeat the indentation without losing the context
-- of what is highlighted
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<C-a>", "ggVG")

vim.keymap.set("n", "<leader>bb", "<cmd>buffers +<CR>")
