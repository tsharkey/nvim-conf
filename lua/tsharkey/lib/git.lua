-- a collection of git utils

local gitutil = {}

function gitutil.git_browse_current_file()
	local file_path = vim.fn.expand("%")
	local line_num = vim.api.nvim_win_get_cursor(0)[1]
	local cmd = "gh browse " .. file_path .. ":" .. line_num
	vim.cmd("!" .. cmd)
end

return gitutil
