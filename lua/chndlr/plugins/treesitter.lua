return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    ts.install({
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
      "typescript",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        -- auto-install parser for unrecognized filetypes (replaces auto_install)
        pcall(ts.install, { vim.bo.filetype })
        -- enable highlighting and indentation if a parser is available
        if pcall(vim.treesitter.start) then
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
