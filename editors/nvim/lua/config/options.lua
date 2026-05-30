-- Editor options. Sensible, fast defaults.
local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes" -- reserve gutter so the layout doesn't jump
opt.termguicolors = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.showmode = false -- mode is shown in the statusline
opt.laststatus = 3 -- single global statusline

-- Indentation (2 spaces; overridden per-language in autocmds / .editorconfig)
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Files & performance
opt.undofile = true -- persistent undo across sessions
opt.swapfile = false
opt.updatetime = 200 -- snappier CursorHold (gitsigns, diagnostics)
opt.timeoutlen = 300 -- which-key responsiveness
opt.clipboard = "unnamedplus" -- use the system clipboard
opt.mouse = "a"
opt.confirm = true -- prompt to save instead of erroring

-- Completion
opt.completeopt = "menu,menuone,noselect"
opt.pumheight = 10

-- Diagnostics presentation
vim.diagnostic.config({
  severity_sort = true,
  virtual_text = { spacing = 2, prefix = "●" },
  float = { border = "rounded", source = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },
})
