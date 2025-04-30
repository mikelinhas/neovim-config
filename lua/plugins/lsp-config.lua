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
					"sqlls",
					"lua_ls",
					"ts_ls",
					"gopls",
					"angularls",
					"kotlin_language_server",
					"jdtls",
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
			lspconfig.sqlls.setup({
				capabilities = capabilities,
				filetypes = { "sql" },
				cmd = {
					"sql-language-server",
				},
			})
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

			-- Java Language Server Configuration
			lspconfig.jdtls.setup({
				capabilities = capabilities,
				cmd = {
					"jdtls", -- Ensure `jdtls` is in your PATH or provide the full path
				},
				root_dir = lspconfig.util.root_pattern(".git", "pom.xml", "build.gradle"),
				settings = {
					java = {
						configuration = {
							runtimes = {
								{
									name = "JavaSE-17",
									path = "/usr/lib/jvm/java-17-openjdk", -- Update this path based on your system
								},
								{
									name = "JavaSE-11",
									path = "/usr/lib/jvm/java-11-openjdk", -- Optional: for Java 11
								},
							},
						},
					},
				},
			})

			-- Angular Language Server Configuration
			lspconfig.angularls.setup({
				capabilities = capabilities,
				root_dir = lspconfig.util.root_pattern("angular.json", "nx.json"), -- Ensures proper root detection
				filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set(
				"n",
				"<space>e",
				vim.diagnostic.open_float,
				{ noremap = true, silent = true, desc = "Show line diagnostics" }
			)
		end,
	},
}
