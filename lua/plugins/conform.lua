return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        typescript = { "prettier" },
        javascript = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        htmlangular = { "prettier" },
        svelte = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        lua = { "stylua" },
        sql = { "sqlfluff" },
      },
    })

    vim.keymap.set("n", "<leader>gf", function()
      conform.format({ async = true, lsp_fallback = true })
    end, { silent = true })

    vim.keymap.set("v", "<leader>f", function()
      conform.format({ async = true, lsp_fallback = true })
    end, { silent = true })
  end,
}
