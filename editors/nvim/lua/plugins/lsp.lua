-- LSP: mason installs servers/tools, lspconfig wires them up, blink provides capabilities.
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      -- Auto-install language servers + formatters (mason package names)
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- LSP servers
          "lua-language-server",
          "vtsls", -- TypeScript / JavaScript
          "eslint-lsp",
          "html-lsp",
          "css-lsp",
          "tailwindcss-language-server",
          "json-lsp",
          "yaml-language-server",
          "bash-language-server",
          "intelephense", -- PHP
          "pyright", -- Python types
          "ruff", -- Python lint/format
          "marksman", -- Markdown
          "dockerfile-language-server",
          "taplo", -- TOML
          -- Formatters
          "stylua",
          "prettierd",
          "shfmt",
          "php-cs-fixer",
        },
        run_on_start = true,
      })

      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Buffer-local keymaps once a server attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
        callback = function(event)
          local function map(keys, fn, desc)
            vim.keymap.set("n", keys, fn, { buffer = event.buf, desc = "LSP: " .. desc })
          end
          map("gd", vim.lsp.buf.definition, "Goto definition")
          map("gD", vim.lsp.buf.declaration, "Goto declaration")
          map("gr", vim.lsp.buf.references, "References")
          map("gi", vim.lsp.buf.implementation, "Goto implementation")
          map("gy", vim.lsp.buf.type_definition, "Type definition")
          map("K", vim.lsp.buf.hover, "Hover docs")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("<leader>cd", vim.diagnostic.open_float, "Line diagnostics")

          -- Toggle inlay hints if the server provides them
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.inlayHintProvider then
            map("<leader>th", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }), { bufnr = event.buf })
            end, "Toggle inlay hints")
          end
        end,
      })

      -- Apply completion capabilities to every server (native 0.11+ API).
      -- Default cmd/filetypes/root markers come from nvim-lspconfig's bundled lsp/ configs.
      vim.lsp.config("*", { capabilities = capabilities })

      -- Per-server overrides
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      vim.lsp.enable({
        "lua_ls", "vtsls", "eslint", "html", "cssls", "tailwindcss",
        "jsonls", "yamlls", "bashls", "intelephense", "pyright", "ruff",
        "marksman", "dockerls", "taplo",
      })
    end,
  },
}
