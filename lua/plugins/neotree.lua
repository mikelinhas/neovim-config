-- NeoTree 📁 --
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				window = {
					auto_expand_width = true,
				},
				renderers = {
					directory = {
						{ "indent" },
						{ "icon" },
						{ "name" },
						{ "git_status", highlight = "NeoTreeDimText" },
					},
					file = {
						{ "indent" },
						{ "icon" },
						{ "name" },
						{ "git_status", highlight = "NeoTreeDimText" },
					},
				},
			},
		})
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle<CR>")
		vim.keymap.set("n", "<leader>n", ":Neotree reveal<CR>")
	end,
}
