vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, { pattern = "*", command = "wa" })

vim.api.nvim_create_autocmd({ "BufWritePre", "FocusLost", "BufLeave" }, {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
