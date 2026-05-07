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
        local ft = vim.bo.filetype
        local parser_configs = require("nvim-treesitter.parsers")
        if parser_configs[ft] then
          pcall(ts.install, { ft })
        end
        if pcall(vim.treesitter.start) then
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
