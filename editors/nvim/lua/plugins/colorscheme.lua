-- Vesper: near-monochrome dark theme with a warm peach accent (matches the terminal).
return {
  {
    "datsfilipe/vesper.nvim",
    lazy = false,
    priority = 1000, -- load before everything else
    config = function()
      require("vesper").setup({
        transparent = false,
        italics = {
          comments = true,
          keywords = false,
          functions = false,
          strings = false,
          variables = false,
        },
      })
      vim.cmd.colorscheme("vesper")
    end,
  },
}
