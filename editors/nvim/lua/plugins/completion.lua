-- blink.cmp: fast (Rust core) completion engine. Uses prebuilt binaries via tagged releases.
return {
  {
    "saghen/blink.cmp",
    version = "*", -- a release tag → ships a prebuilt fuzzy-matcher binary (no Rust toolchain needed)
    event = "InsertEnter",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      -- default preset: <C-space> toggle, <C-y> accept, <C-n>/<C-p> select, <C-e> hide
      keymap = { preset = "default" },
      appearance = { nerd_font_variant = "mono" },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        menu = { border = "rounded" },
        ghost_text = { enabled = true },
      },
      signature = { enabled = true, window = { border = "rounded" } },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
}
