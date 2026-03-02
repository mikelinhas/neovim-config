-- NeoTest 🧪 --
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-jest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "npx jest",
        }),
      },
    })

    vim.keymap.set("n", "<leader>tr", function() require("neotest").run.run() end, { desc = "Neotest: run nearest" })
    vim.keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Neotest: run file" })
    vim.keymap.set("n", "<leader>to", function() require("neotest").output.open({ enter = true }) end, { desc = "Neotest: open output" })
    vim.keymap.set("n", "<leader>tS", function() require("neotest").summary.toggle() end, { desc = "Neotest: toggle summary" })
    vim.keymap.set("n", "<leader>tq", function() require("neotest").run.stop() end, { desc = "Neotest: stop" })
  end,
}
