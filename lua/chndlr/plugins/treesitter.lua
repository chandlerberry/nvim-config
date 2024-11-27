-- configure treesitter


return {
	"nvim-treesitter/nvim-treesitter",
    	build = ":TSUpdate",
    	config = function () 
	local configs = require("nvim-treesitter.configs")
		configs.setup({
		ensure_installed = {"c", "go", "cpp", "zig", "bash", "python", "vim", "rust", "yaml", "dockerfile", "tmux", "sway", "sql", "nginx"},
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },
	})
	end
}
