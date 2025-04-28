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
					"gopls",
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
				"gopls",
			})

			-- view configuration options with `:h vim.diagnostic.opts`
			vim.diagnostic.config({
				virtual_text = true,
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
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "ruff_organize_imports", "ruff_format", "ruff_fix" },
					go = { "goimports", "gofmt" },
					javascript = { "prettierd", "prettier", stop_after_first = true },
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_format = "fallback",
				},
				default_format_opts = {
					lsp_format = "fallback",
				},
			})
			vim.keymap.set("n", "<leader>gf", require("conform").format, {})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
}
