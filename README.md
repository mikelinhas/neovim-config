# Neovim Config

Personal Neovim configuration. Plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim). Leader key: `<Space>`.

---

## Cheatsheet

### File Navigation

| Key | Action |
|-----|--------|
| `<C-p>` | Find files (Telescope) |
| `<leader>fg` | Live grep across project (Telescope) |
| `<C-n>` | Toggle file tree (Neo-tree) |
| `<leader>n` | Reveal current file in tree |
| `<leader>w` | Switch to last window |

### Buffers

| Key | Action |
|-----|--------|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<leader>bd` | Delete buffer (with menu) |
| `<leader>bh` | Delete all hidden buffers |

### Harpoon (bookmarks)

| Key | Action |
|-----|--------|
| `<leader>a` | Add current file to harpoon |
| `<leader>hm` | Toggle harpoon menu |
| `<leader>1` | Jump to mark 1 |
| `<leader>2` | Jump to mark 2 |
| `<leader>3` | Jump to mark 3 |
| `<leader>4` | Jump to mark 4 |

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gy` | Go to type definition |
| `gi` | Go to implementation |
| `gr` | Go to references |
| `K` | Hover docs |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>gf` | Format file |
| `<leader>f` | Format selection (visual mode) |
| `<leader>br` | Restart LSP |

### Completion (nvim-cmp)

| Key | Action |
|-----|--------|
| `<Tab>` | Next item / expand or jump snippet |
| `<S-Tab>` | Previous item / jump back in snippet |
| `<CR>` | Confirm selection |
| `<C-space>` | Trigger completion manually |
| `<C-j>` | Expand snippet / jump to next field |
| `<C-k>` | Jump to previous snippet field |

### Testing (Neotest + Jest)

| Key | Action |
|-----|--------|
| `<leader>tr` | Run nearest test |
| `<leader>tf` | Run all tests in file |
| `<leader>to` | Open test output |
| `<leader>tS` | Toggle test summary panel |
| `<leader>tq` | Stop test run |

> Adapter: `neotest-jest` (uses `npx jest`). Add more adapters in `lua/plugins/neotest.lua`.

### Comments

| Key | Action |
|-----|--------|
| `<leader>cc` | Toggle line comment |
| `<leader>cb` | Toggle block comment |

### Clipboard

| Key | Action |
|-----|--------|
| `<leader>y` | Yank to system clipboard |
| `<leader>Y` | Yank line to system clipboard |

### Moving Code

| Key | Action |
|-----|--------|
| `J` (visual) | Move selection down |
| `K` (visual) | Move selection up |

### Config

| Key | Action |
|-----|--------|
| `<leader>sv` | Reload `init.lua` |
| `<leader><leader>` | Reload all Lua config |

---

## LSP Servers (via Mason)

`lua_ls`, `jdtls`, `kotlin_language_server`, `jsonls`, `ts_ls`, `angularls`, `svelte`, `eslint`

Mason tools: `prettier`, `stylua`

---

## Plugin List

| Plugin | Role |
|--------|------|
| `lazy.nvim` | Plugin manager |
| `catppuccin` | Colorscheme |
| `lualine` | Status line (dracula theme) |
| `neo-tree` | File explorer |
| `telescope` | Fuzzy finder |
| `treesitter` | Syntax highlighting / parsing |
| `nvim-lspconfig` | LSP server configs |
| `mason.nvim` | LSP server installer |
| `nvim-cmp` | Completion engine |
| `LuaSnip` | Snippet engine |
| `conform.nvim` | Formatting (prettier / stylua) |
| `harpoon` | File bookmarks |
| `neotest` | Test runner |
| `Comment.nvim` | Code commenting |
| `alpha-nvim` | Start screen |

---

## Adding a Plugin

Create `lua/plugins/<name>.lua` returning a lazy.nvim spec — it's auto-discovered, no registration needed.

## Java Setup

Java paths in `lua/plugins/lsp.lua` are hardcoded to this machine. Verify after a fresh clone:

- Java home: `~/.sdkman/candidates/java/21.0.3-tem`
- Lombok jar: `~/lombok-1.18.30.jar`
- Angular LS: `~/.nvm/versions/node/v20.19.2/lib/node_modules/@angular/language-server`
