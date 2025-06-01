return {
	"folke/trouble.nvim",
	opts = {
  modes = {
    mydiags = {
      mode = "diagnostics", -- inherit from diagnostics mode
      preview = {
        type = "split",
        relative = "win",
        position = "right",
        size = 0.3,
      },
      filter = {
        any = {
          buf = 0, -- current buffer
          {
            severity = vim.diagnostic.severity.ERROR, -- errors only
            -- limit to files in the current project
            function(item)
              return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
            end,
          },
        },
      },
    }
  }
},
	cmd = "Trouble",
	keys = {
    {
			"<leader>xx",
			"<cmd>Trouble mydiags toggle focus=true<cr>",
			desc = "Diagnostics (Trouble)",
		},
  }
}
