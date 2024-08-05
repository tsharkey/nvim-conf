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

vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")

-- Map <leader>go to the function
vim.keymap.set("n", "<leader>go", git_browse_current_file, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>jj", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

-- Function to toggle the matching notes file
-- Function to get the current git branch
local function get_git_branch()
	local handle = io.popen("git branch --show-current 2>/dev/null")
	local result = handle:read("*a")
	handle:close()
	return result:gsub("^%s*(.-)%s*$", "%1") -- Trim whitespace
end

-- Function to get the current date in YYYY-MM-DD format
local function get_current_date()
	return os.date("%Y-%m-%d")
end

-- Function to open and prepare the matching notes file
function open_matching_notes()
	-- Get the current file name
	local current_file = vim.fn.expand("%:t")

	-- Generate the matching notes file name
	local notes_file = vim.fn.expand("%:t:r") .. ".notes.md"

	-- Check if the notes file is already open in a window
	local notes_win = vim.fn.bufwinnr(notes_file)

	if notes_win ~= -1 then
		-- If the notes file is open, close its window
		vim.cmd(notes_win .. "wincmd c")
	else
		-- If the notes file is not open, open it
		if vim.fn.filereadable(notes_file) == 1 then
			-- Open the existing notes file in a vertical split
			vim.cmd("vsplit " .. notes_file)
		else
			-- If the file doesn't exist, create it and open in a vertical split
			vim.cmd("vsplit " .. notes_file)
			vim.cmd("write")
		end

		-- Move cursor to the top of the file
		vim.cmd("normal! gg")

		-- Get the current content of the file
		local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

		-- Check if the file is empty or doesn't start with our header format
		if #lines == 0 or not lines[1]:match("^# .*%([%d-]+%)$") then
			-- Insert the branch name and date at the top of the file
			local branch = get_git_branch()
			local date = get_current_date()
			local header = string.format("# %s (%s)\n\n", branch, date)

			vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(header, "\n"))
		end

		-- Move cursor to the line after the header
		vim.cmd("normal! gg")
		vim.cmd("normal! 2j")
	end
end

-- Map the function to <leader>no in normal mode
vim.api.nvim_set_keymap("n", "<leader>no", ":lua open_matching_notes()<CR>", { noremap = true, silent = true })
