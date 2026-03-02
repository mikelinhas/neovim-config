# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration written in Lua, using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. The config targets Neovim 0.9+.

## Architecture

**Entry point:** `init.lua` sets global vim options (tabs, line numbers), then loads `config/lazy` and `remap`.

**Plugin loading:** `lua/config/lazy.lua` bootstraps lazy.nvim and calls `require("lazy").setup("plugins", opts)`, which auto-discovers all files under `lua/plugins/`. Each file returns a plugin spec table. `lua/plugins.lua` exists but returns `{}` (unused placeholder).

**Keymaps:** All custom keymaps live in `lua/remap.lua`. Plugin-specific keymaps are defined inside each plugin's `config` function in its own file under `lua/plugins/`.

**Leader key:** `<Space>`

## Adding a Plugin

Create a new file `lua/plugins/<name>.lua` that returns a lazy.nvim plugin spec. It is automatically picked up — no registration needed.

## Key Plugin Notes

- **LSP/completion:** Native nvim LSP stack. `lua/plugins/lsp.lua` — mason + mason-lspconfig + nvim-lspconfig (all server configs). `lua/plugins/cmp.lua` — nvim-cmp + LuaSnip. `lua/plugins/conform.lua` — formatting via conform.nvim + prettier. Restart LSP with `<leader>br`.
- **Colorscheme:** Catppuccin (set in `lua/plugins/catppuccin.lua`). Lualine uses the dracula theme independently.
- **Neotest** is active in `lua/plugins/neotest.lua` with neotest-jest (uses `npx jest`). Keymaps: `<leader>tr/tf/to/tS/tq`.
- **Harpoon** keymaps: `<leader>a` add file, `<leader>hm` menu, `<leader>1-4` jump to mark.

## Key Keybindings Reference

| Key | Action |
|-----|--------|
| `<C-p>` | Telescope find files |
| `<leader>fg` | Telescope live grep |
| `<C-n>` | Toggle Neo-tree |
| `<leader>n` | Neo-tree reveal current file |
| `<leader>w` | Switch to last window |
| `<Tab>` / `<S-Tab>` | Next/previous buffer |
| `<leader>bd` | Delete buffer (menu) |
| `gd` / `gy` / `gi` / `gr` | LSP go-to definition/type/implementation/references |
| `K` | LSP hover docs |
| `<leader>rn` | LSP rename |
| `<leader>ca` | LSP code action |
| `<leader>gf` | Format file (conform.nvim) |
| `<leader>f` | Format selection (conform.nvim, visual mode) |
| `<leader>cc` / `<leader>cb` | Toggle line/block comment |
| `<leader>y` / `<leader>Y` | Yank to system clipboard |
| `<leader>sv` | Reload init.lua |
| `<leader><leader>` | Reload all Lua config |

## LSP Servers (via Mason)

`lua_ls`, `jdtls`, `kotlin_language_server`, `jsonls`, `ts_ls`, `angularls`, `svelte`, `eslint`

Mason tools: `prettier`, `stylua`

Java/Angular paths in `lua/plugins/lsp.lua` are hardcoded to this machine (`/Users/U774585`). Update when working on a new machine. Angular uses a global `@angular/language-server` install via nvm to bypass the stale bundled version.
