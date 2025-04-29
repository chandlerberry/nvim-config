-- configure the colorscheme
return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme tokyonight]])
	end,
	opts = {
		transparent = true,
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
	},
}
