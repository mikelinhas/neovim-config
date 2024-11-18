return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"gopls",
					"angularls",
					"kotlin_language_server",
					"java_language_server",
          "zls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.kotlin_language_server.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			})
      lspconfig.zls.setup({
        capabilities = capabilities,
      })

			-- JAVA doesn't work and even breaks the syntax --
			-- lspconfig.java_language_server.setup({
			-- 	capabilities = capabilities,
			-- })

			-- Angular LSP is not really working i think --
			lspconfig.angularls.setup({
				capabilities = capabilities,
				on_new_config = function(new_config, new_root_dir)
					new_config.cmd = {
						"ngserver",
						"--stdio",
						"--tsProbeLocations",
						new_root_dir,
						"--ngProbeLocations",
						new_root_dir,
					}
				end,
				filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
		end,
	},
}
