return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			toggler = {
				---line-comment toggle keymap
				line = "<leader>cc",
				---block-comment toggle keymap
				block = "<leader>cb",
			},
		})
	end,
	lazy = false,
}
