-- configure treesitter


return {
	"nvim-treesitter/nvim-treesitter",
    	build = ":TSUpdate",
    	config = function () 
	local configs = require("nvim-treesitter.configs")
		configs.setup({
		ensure_installed = {"c", "python", "vim", "rust", "yaml"},
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },
	})
	end
}
