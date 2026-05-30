-- Editing aids. (Commenting uses Neovim's built-in `gc`/`gcc`, no plugin needed.)
return {
  -- Auto-close brackets/quotes
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  -- Add/change/delete surrounding pairs: ys, cs, ds
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    opts = {},
  },
}
