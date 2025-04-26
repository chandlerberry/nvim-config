-- configure treesitter
return {
  "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
	  local config = require("nvim-treesitter.configs")
		config.setup({
      ensure_installed = {
        "c",
        "go",
        "cpp",
        "bash",
        "python",
        "vim",
        "rust",
        "yaml",
        "dockerfile",
        "tmux",
        "sql",
        "nginx",
        "lua",
        "toml",
        "json",
        "jq",
        "html",
        "terraform",
        "caddy",
      },
      auto_install=true,
		  sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
	  })
  end
}
