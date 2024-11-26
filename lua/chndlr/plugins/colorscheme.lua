-- configure the colorscheme

return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
	--load colorscheme
		vim.cmd([[colorscheme tokyonight]])
	end,
}
