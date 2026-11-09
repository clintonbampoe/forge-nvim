# Keymaps

Leader key: `Space`. Everything is Normal mode unless the row says otherwise.

Each section covers one area of the config, and its heading names the file that defines those keys. To change a keymap, edit that file and update the matching row here. To remove one, delete both.

## Find and search — `lua/plugins/telescope.lua`

| Key            | Action                                      |
| -------------- | ------------------------------------------- |
| `<leader>ff`   | Find files                                  |
| `<leader>fg`   | Search text across all files (needs ripgrep) |
| `<leader>fb`   | Pick from open buffers                      |
| `<leader>fh`   | Search Neovim help                          |


Inside the telescope window:

| Key               | Action                        |
| ----------------- | ----------------------------- |
| `<C-n>` / `<C-p>` | Move through results          |
| `<CR>`            | Open the selected file        |
| `<C-x>`           | Open in a horizontal split    |
| `<C-v>`           | Open in a vertical split      |
| `<Esc>`           | Close telescope               |


## Diagnostics — `lua/plugins/trouble.lua`

| Key          | Action                                        |
| ------------ | --------------------------------------------- |
| `<leader>ft` | Toggle the workspace diagnostics list         |
| `<C-t>`      | Toggle the diagnostics list for this buffer   |

The diagnostic under the cursor also pops up automatically after a short pause (set in `init.lua`).

## LSP — `lua/plugins/lsp.lua`
Active in any buffer where a language server is attached.

| Key          | Action                                                     |
| ------------ | ---------------------------------------------------------- |
| `gd`         | Go to definition                                           |
| `gr`         | Show references                                            |
| `K`          | Hover documentation                                        |
| `<C-k>`      | Hover documentation (replaces window-up in LSP buffers; defined in `init.lua`) |
| `<F2>`       | Rename symbol (defined in `init.lua`)                      |
| `<leader>rn` | Rename symbol                                              |
| `<leader>ca` | Code action, built-in picker                               |
| `<M-CR>`     | Code action, fancy picker (`lua/plugins/tiny-code-action.lua`) |
| `<leader>th` | Toggle inlay hints (defined in `init.lua`)                 |


## C# only — `lua/plugins/csharp.lua`

| Key          | Action                        |
| ------------ | ----------------------------- |
| `<leader>fu` | Find usages through telescope |


## Completion menu — `lua/plugins/auto-completion.lua`
Active while the menu is open, in Insert mode.

| Key               | Action                                              |
| ----------------- | --------------------------------------------------- |
| `<C-n>` / `<C-p>` | Next / previous suggestion                          |
| `<Tab>`           | Confirm the selected suggestion                     |
| `<CR>`            | Confirm, but only if you explicitly selected an item |
| `<Esc>`           | Close the menu                                      |

Suggestions come from, in order: LSP → snippets → words in the buffer → file paths.

## Folding — `lua/plugins/editor.lua`

| Key  | Action                                                                              |
| ---- | ----------------------------------------------------------------------------------- |
| `zR` | Open all folds                                                                      |
| `zM` | Close all folds                                                                     |
| `K`  | Peek inside the fold under the cursor (non-LSP buffers only; in LSP buffers `K` is hover docs) |


## Git — `lua/plugins/git.lua`

| Key          | Action                                              |
| ------------ | --------------------------------------------------- |
| `<leader>gg` | Open lazygit (press `?` for its keys, `q` to quit)  |
| `<leader>gp` | Preview the change under the cursor                 |
| `]c` / `[c`  | Jump to next / previous change                      |


## Terminal — `lua/plugins/terminal.lua`

| Key    | Action                    |
| ------ | ------------------------- |
| `<C-\>` | Toggle the floating terminal |


Inside the terminal, in Terminal mode:

| Key                              | Action                                |
| -------------------------------- | ------------------------------------- |
| `<Esc><Esc>`                     | Return to Normal mode                 |
| `<C-h>` `<C-j>` `<C-k>` `<C-l>`  | Move to the window left / below / above / right |


## Explorer, buffers and windows — `init.lua`

| Key                              | Action                          |
| -------------------------------- | ------------------------------- |
| `<leader>e`                      | Toggle the file explorer (neo-tree) |
| `<Tab>` / `<S-Tab>`              | Next / previous buffer          |
| `<leader>bn`                     | New empty buffer                |
| `<leader>bd`                     | Delete current buffer           |
| `<C-h>` `<C-j>` `<C-k>` `<C-l>`  | Move to the window left / below / above / right |


## Editor — `init.lua`

| Key | Action                                                    |
| --- | --------------------------------------------------------- |
| `<C-y>` | Open a new line below and keep typing (Insert mode)   |
| `q`     | Does nothing — macro recording is disabled on purpose |

## Commands

Go helpers, defined in `lua/plugins/go.lua`:

| Command       | Action                                          |
| ------------- | ----------------------------------------------- |
| `:GoFmt`      | Format the buffer with gofumpt                  |
| `:GoImports`  | Fix imports with goimports                      |
| `:GoLint`     | Run golangci-lint; results land in the quickfix list |
| `:GoVet`      | Run go vet; results land in the quickfix list   |
| `:GoRun`      | Run the current package in a terminal split     |

Plugin and tool management:

| Command        | Action                                                                  |
| -------------- | ------------------------------------------------------------------------ |
| `:Lazy`        | Plugin manager — `:Lazy sync` installs and updates, `:Lazy clean` removes unused plugins |
| `:Mason`       | Manage installed LSP servers, formatters and tools                       |
| `:ConformInfo` | Show which formatter applies to the current file                         |
| `:TSUpdate`    | Update treesitter parsers                                                |
| `:checkhealth` | Diagnose problems with Neovim and plugins                                |
