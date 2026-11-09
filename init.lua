local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 5

-- Tabs
opt.expandtab = true
opt.softtabstop = 2
opt.tabstop = 2
opt.shiftwidth = 2
opt.smartindent = true

-- Code folding
vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldclose:,foldsep: ,foldinner: '

-- Column bar
opt.colorcolumn = '80,120'
local function style_guides()
  vim.api.nvim_set_hl(0, 'ColorColumn', {})
  vim.api.nvim_set_hl(0, 'VirtColumn', { link = 'LineNr' })
end
style_guides()
vim.api.nvim_create_autocmd('ColorScheme', { callback = style_guides })

-- Misc
opt.termguicolors = true
opt.background = 'dark'
opt.clipboard = 'unnamedplus'
opt.sidescrolloff = 10
opt.scrolloff = 10
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250
opt.cursorline = true

vim.g.mapleader = ' '

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move down' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move up' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move right' })

-- Misc
vim.keymap.set('i', '<C-y>', '<Esc>o', { desc = 'New line below' })
vim.keymap.set('n', 'q', '<Nop>', { desc = 'Disable macro recording' })
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'Toggle Neotree' })

-- buffers & tabs
vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<CR>', { desc = 'Prev buffer' })
vim.keymap.set('n', '<leader>bn', '<cmd>enew<CR>', { desc = 'New buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete buffer' })

-- Diagnostics
vim.diagnostic.config({
  underline = true,
  update_in_insert = true,
  virtual_text = { spacing = 4, prefix = '●' },
  severity_sort = true,
})

vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

-- Fold Peeking Keybind
vim.keymap.set('n', 'K', function()
  local winid = require('ufo').peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end, { desc = 'Peek Fold / Hover' })

-- LSP: runs for every buffer an LSP attaches to
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf

    vim.keymap.set('n', 'gr', function()
      vim.lsp.buf.references({ include_declaration = true })
    end, { buffer = bufnr, desc = 'References' })

    -- K is the vim convention for hover; avoids <C-k> conflict with window nav
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover docs' })
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename symbol' })
  end,
})

-- Toggle inlay hints for current buffer
vim.api.nvim_create_user_command('ToggleInlayHints', function()
  local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
  vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
end, {})
vim.keymap.set('n', '<leader>th', '<cmd>ToggleInlayHints<cr>', { desc = 'Toggle inlay hints' })

-- Mason binaries on PATH so LSPs/tools work without full paths
vim.env.PATH = vim.fn.stdpath('data') .. '/mason/bin:' .. vim.env.PATH

-- Session options
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

require('config.lazy')
