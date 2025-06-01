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

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("FixTerraformCommentString", { clear = true }),
  callback = function(ev)
    vim.bo[ev.buf].commentstring = "# %s"
  end,
  pattern = { "terraform", "hcl" },
})

-- Show diagnostics in floating window on cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})

-- Reduce the delay before CursorHold triggers (default is 4000ms)
vim.opt.updatetime = 800
