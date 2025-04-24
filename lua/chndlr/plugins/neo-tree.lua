return {
	"nvim-neo-tree/neo-tree.nvim",
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
    require("neo-tree").setup({
      
    })
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
}
