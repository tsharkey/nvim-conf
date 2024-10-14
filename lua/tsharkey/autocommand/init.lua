vim.api.nvim_create_autocmd({ "BufWritePre", "FocusLost" }, {
	pattern = "*",
	callback = function(args)
		local buftype = vim.bo[args.buf].buftype
		if not vim.bo.readonly and vim.bo.modifiable and buftype ~= "nofile" and buftype ~= "prompt" then
			require("conform").format({ bufnr = args.buf })
		end
	end,
})
