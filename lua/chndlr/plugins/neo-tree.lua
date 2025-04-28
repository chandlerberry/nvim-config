return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = false,
	opts = {
		window = {
			position = "right",
		},
	},
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({})
		vim.keymap.set("n", "<leader>er", ":Neotree filesystem toggle right<CR>", {})
		vim.keymap.set("n", "<leader>ew", ":Neotree filesystem toggle left<CR>", {})
		vim.keymap.set("n", "<leader>ef", ":Neotree filesystem toggle float<CR>", {})
		-- vim.keymap.set("n", "<leader>ec", ":Neotree close filesystem<CR>")

		vim.keymap.set("n", "<leader>eb", ":Neotree buffers reveal float<CR>", {})
	end,
}
