return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"zapling/mason-conform.nvim",
		},
		opts = {},
		config = function()
			require("mason").setup()
			require("mason-conform").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("*", {
				root_markers = { ".git" },
				capabilities = capabilities,
			})
			vim.lsp.enable({
				"lua_ls",
				"asm_lsp",
				"bashls",
				"cmake",
				"cssls",
				"tailwindcss",
				"jinja_lsp",
				"docker_compose_language_service",
				"dockerls",
				"gopls",
				"html",
				"htmx",
				"hyprls",
				"jsonls",
				"ltex",
				"grammarly",
				"ruff",
				"vimls",
				"yamlls",
			})

			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})

			vim.diagnostic.config({ virtual_text = true })
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "ruff" },
					rust = { "rustfmt", lsp_format = "fallback" },
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
				formatters = {
					clang_format = {
						prepend_args = { "--style=file" },
					},
				},
			})
			vim.keymap.set("n", "<leader>gf", require("conform").format, {})
		end,
	},
}
