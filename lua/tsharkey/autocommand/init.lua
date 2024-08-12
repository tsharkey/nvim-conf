-- this is something I just grew very accustomed to on VS Code
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
	pattern = "*",
	callback = function(args)
		local buftype = vim.bo[args.buf].buftype
		-- ignore harpoon buffer
		if buftype ~= "acwrite" then
			vim.cmd("wa")
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre", "FocusLost", "BufLeave" }, {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
