return {
	"tadaa/vimade",
	lazy = false,
	config = function()
		require("vimade").setup({
			recipe = { "duo", { animate = true } },
			tint = { bg = { rgb = { 0, 0, 0 }, intensity = 0.3 } },
		})
	end,
}
