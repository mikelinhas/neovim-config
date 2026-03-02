return {
  -- Mason: installs LSP servers and tools
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  -- Installs non-LSP Mason tools (formatters, linters)
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = { "prettier", "stylua" },
      })
    end,
  },

  -- Bridges mason.nvim and nvim-lspconfig; auto-enables installed servers
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "jdtls",
          "kotlin_language_server",
          "jsonls",
          "ts_ls",
          "angularls",
          "svelte",
          "eslint",
          "tailwindcss",
        },
        automatic_enable = true,
      })
    end,
  },

  -- Provides default server configs (lsp/*.lua); no require('lspconfig') needed
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "b0o/SchemaStore.nvim",
    },
    config = function()
      -- Global: share nvim-cmp capabilities with every server
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- Keymaps on every LSP attach (replaces on_attach)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf, silent = true }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>br", "<cmd>LspRestart<CR>", opts)
        end,
      })

      vim.diagnostic.config({
        signs = {
          text = { [vim.diagnostic.severity.ERROR] = "✗" },
        },
        virtual_text = true,
        update_in_insert = false,
      })

      -- Per-server overrides (merged with nvim-lspconfig defaults)

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = { diagnostics = { globals = { "vim" } } },
        },
      })

      vim.lsp.config("jdtls", {
        settings = {
          java = {
            jdt = {
              ls = {
                vmargs = "-javaagent:/Users/U774585/lombok-1.18.30.jar -Xbootclasspath/a:/Users/U774585/lombok-1.18.30.jar",
              },
            },
            configuration = {
              runtimes = {
                { name = "JavaSE-21", path = "/Users/U774585/.sdkman/candidates/java/21.0.3-tem", default = true },
              },
            },
          },
        },
        init_options = {
          workspace = vim.fn.expand("~/.cache/jdtls/workspace/")
            .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
        },
      })

      vim.lsp.config("jsonls", {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })

      vim.lsp.config("cssls", {
        settings = {
          css = { validate = true, lint = { unknownAtRules = "ignore" } },
          scss = { validate = true, lint = { unknownAtRules = "ignore" } },
          less = { validate = true, lint = { unknownAtRules = "ignore" } },
        },
      })

      local ng_ls = "/Users/U774585/.nvm/versions/node/v20.19.2/lib/node_modules/@angular/language-server"

      vim.lsp.config("angularls", {
        filetypes = { "typescript", "html", "htmlangular", "typescriptreact" },
        -- on_new_config runs per-project with the detected root dir, so
        -- --tsProbeLocations points at the project's own node_modules where
        -- typescript is actually installed (not the sparse global modules).
        on_new_config = function(new_config, new_root_dir)
          new_config.cmd = {
            "node", ng_ls,
            "--stdio",
            "--tsProbeLocations", new_root_dir,
            "--ngProbeLocations", new_root_dir,
          }
        end,
      })
    end,
  },

  -- Rich JSON schema validation
  { "b0o/SchemaStore.nvim", lazy = true },
}
