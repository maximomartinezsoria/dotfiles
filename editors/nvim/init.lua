-- Neovim config entry point.
-- Real configuration lives in lua/config (settings) and lua/plugins (one file per plugin).

-- Leader keys must be set BEFORE lazy.nvim loads so plugin `keys` use the right leader.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")
