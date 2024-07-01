return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local theme = require("lualine.themes.powerline_dark")

		-- set bg transparency in all modes
		theme.normal.c.bg = nil
		theme.insert.c.bg = nil
		theme.visual.c.bg = nil
		theme.replace.c.bg = nil
		theme.command.c.bg = nil

		require("lualine").setup({
			options = {
				theme = theme,
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { { "diagnostics", sources = { "nvim_lsp" } }, "branch" },
				lualine_c = { "diff" },
				lualine_x = { "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},

			tabline = {
				lualine_b = { { "filename", path = 1 }, "aerial", "location" },
			},
		})
	end,
}
