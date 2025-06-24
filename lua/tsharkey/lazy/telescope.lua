return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
	},
	config = function()
		require("telescope").setup({
			pickers = {
				buffers = {
					mappings = {
						i = {
							["<c-d>"] = "delete_buffer",
						},
					},
				},
				find_files = {
					hidden = true,
					file_ignore_patterns = { ".git/" },
					-- Add this to ignore .gitignore rules if needed
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
				live_grep = {
					file_ignore_patterns = { ".git/" },
					additional_args = function(_) -- Fixed typo here
						return { "--hidden" }
						-- Add "--no-ignore" here if you want to ignore .gitignore rules
						-- return { "--hidden", "--no-ignore" }
					end,
				},
			},
		})
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		require("telescope").load_extension("live_grep_args")
		vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
		vim.keymap.set("n", "<leader>mm", ":Telescope lsp_document_symbols<CR>")
	end,
}
