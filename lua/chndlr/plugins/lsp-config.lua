return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ruff",
					"pyright",
					"docker_compose_language_service",
					"dockerls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.enable({
				"lua_ls",
				"ruff",
				"pyright",
				"docker_compose_language_service",
				"dockerls",
			})

      -- view configuration options with `:h vim.diagnostic.opts`
      vim.diagnostic.config({
        virtual_text=true,
      })

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.lsp.config("dockerls", {
				settings = {
					docker = {
						language_server = {
							formatter = {
								ignoreMultilineInstructions = true,
							},
						},
					},
				},
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
