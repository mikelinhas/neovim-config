vim.g.mapleader = " "

-- buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")
vim.keymap.set("n", "<leader>bd", ":Bdelete menu<CR>")
vim.keymap.set("n", "<leader>bh", ":Bdelete hidden<CR>")

-- move highlighted code
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- next greatest remap ever : asbjornHaland
-- yank into the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- reload nvim
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>")

-- Reload all Lua modules (and recompile Lazy plugins if needed)
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
  print("Neovim config reloaded!")
end)

