return {
  "neoclide/coc.nvim",
  branch = "release",
  build = "yarn install --frozen-lockfile",
  init = function()
    vim.g.coc_global_extensions = {
      "coc-lua",
      "coc-java",
      "coc-kotlin",
      "coc-json",
      "coc-tsserver",
      "coc-eslint",
      "coc-prettier",
      "coc-snippets",
    }
  end,
  config = function()
    -- Keymaps for common CoC features
    local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

    -- Use Tab for trigger completion with characters ahead and navigate
    -- NOTE: There's always a completion item selected by default, you may want to enable
    -- no select by setting `"suggest.noselect": true` in your configuration file
    -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
    -- other plugins before putting this into your config
    vim.keymap.set("i", "<TAB>",
      'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
      opts)
    vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
    -- Make <CR> to accept selected completion item or notify coc.nvim to format
    -- <C-g>u breaks current undo, please make your own choice
    vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
      opts)

    -- Use <c-j> to trigger snippets
    vim.keymap.set("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
    -- Use <c-space> to trigger completion
    vim.keymap.set("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })
    vim.keymap.set("n", "<leader>br", ":CocRestart<CR>")
    vim.keymap.set("n", "<leader>gf", "<Plug>(coc-format)", { silent = true })
    vim.keymap.set("n", "<leader>f", "<Plug>(coc-format-selected)")
    vim.keymap.set("v", "<leader>f", "<Plug>(coc-format-selected)")
    vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
    vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
    vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
    vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })
    vim.keymap.set("n", "K", ":call CocActionAsync('doHover')<CR>", { silent = true })
    vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })
    vim.keymap.set("n", "<leader>ca", "<Plug>(coc-codeaction)", { silent = true })
  end,
}
