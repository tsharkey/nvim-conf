-- creates a note file next to the file you are currently editing
-- I use this to keep notes about projects while also adding */**/*.notes.md to my global .gitignore
-- prevents excessive commenting while still allowing me to help future me

local notes = {}

local function get_git_branch()
	local handle = io.popen("git branch --show-current 2>/dev/null")
	local result = handle:read("*a")
	handle:close()
	return result:gsub("^%s*(.-)%s*$", "%1") -- Trim whitespace
end

local function get_current_date()
	return os.date("%Y-%m-%d")
end

local function region_to_text(region)
	local text = ""
	local maxcol = vim.v.maxcol
	for line, cols in vim.spairs(region) do
		local endcol = cols[2] == maxcol and -1 or cols[2]
		local chunk = vim.api.nvim_buf_get_text(0, line, cols[1], line, endcol, {})[1]
		text = ("%s%s\n"):format(text, chunk)
	end
	return text
end

function notes.open_matching_notes()
	local cur_file_type = vim.bo.filetype
	local notes_file = vim.fn.expand("%:r") .. ".notes.md"
	local notes_win = vim.fn.bufwinnr(notes_file)

	-- Get the visually selected text, if any
	local visual_selection = ""
	if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
		visual_selection = region_to_text(vim.region(0, "v", ".", vim.fn.visualmode(), true))
	end

	-- if the notes window is already open focus to that window
	if notes_win ~= -1 then
		vim.cmd(notes_win .. "wincmd w")
	else
		if vim.fn.filereadable(notes_file) == 1 then
			vim.cmd("vsplit " .. notes_file)
		else
			vim.cmd("vsplit " .. notes_file)
			vim.cmd("write")
		end

		vim.cmd("normal! gg")

		local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

		local branch = get_git_branch()
		local date = get_current_date()
		local header = string.format("# %s (%s)\n\n", branch, date)

		if #lines == 0 then
			vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(header, "\n"))
		else
			local first_line = lines[1]
			local existing_branch, existing_date = first_line:match("^# (.*) %((%d%d%d%d%-%d%d%-%d%d)%)$")

			if not existing_branch or not existing_date or existing_branch ~= branch or existing_date ~= date then
				vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(header, "\n"))
			end
		end

		if visual_selection ~= "" then
			local code_block = vim.split("\n```" .. cur_file_type .. "\n" .. visual_selection .. "\n```\n", "\n", true)
			vim.api.nvim_buf_set_lines(0, 2, 2, false, code_block)
		end
		vim.cmd("normal! gg")
		vim.cmd("normal! 2j")
		vim.cmd("startinsert")
	end
end

return notes
