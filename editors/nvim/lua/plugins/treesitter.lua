-- Treesitter: better syntax highlighting and indentation.
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master", -- stable API (the new `main` branch is a different, WIP rewrite)
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdate", "TSInstall", "TSInstallInfo", "TSModuleInfo" },
    opts = {
      ensure_installed = {
        "bash", "c", "css", "scss", "dockerfile", "git_config", "gitcommit",
        "gitignore", "go", "html", "javascript", "json", "lua",
        "luadoc", "markdown", "markdown_inline", "php", "python", "query",
        "regex", "rust", "sql", "toml", "tsx", "typescript", "vim", "vimdoc", "yaml",
      },
      auto_install = true, -- install missing parsers when you open a new filetype
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      -- jsonc has no reliable parser release; reuse the json parser for it
      vim.treesitter.language.register("json", "jsonc")
    end,
  },
}
