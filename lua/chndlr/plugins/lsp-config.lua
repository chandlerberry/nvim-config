return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
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
    config = function()
      vim.lsp.enable({
        "lua_ls",
        "ruff",
        "pyright",
        "docker_compose_language_service",
        "dockerls",
      })

      vim.lsp.config("pyright", {})

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
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
