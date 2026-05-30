-- Bootstrap and configure lazy.nvim (plugin manager).
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = { { import = "plugins" } },
  defaults = { version = false }, -- always use the latest commit unless a plugin pins one
  install = { colorscheme = { "vesper" } },
  checker = { enabled = false }, -- don't poll for updates (startup perf)
  change_detection = { notify = false },
  ui = { border = "rounded" },
  performance = {
    rtp = {
      -- Disable built-in plugins we don't use
      disabled_plugins = {
        "gzip", "tarPlugin", "zipPlugin", "tohtml", "tutor",
        "netrwPlugin", -- replaced by neo-tree
        "rplugin",
      },
    },
  },
})
