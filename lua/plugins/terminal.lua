return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    size = 20,
    open_mapping = [[<c-\>]],
    direction = 'float',
    shade_terminals = true,
    start_in_insert = true,
    persist_size = true,
    float_opts = {
      border = 'curved',
      winblend = 0,
    },
  },
  keys = {
    { '<C-\\>', '<Cmd>ToggleTerm<CR>', desc = 'Toggle Terminal' },
    { '<Esc><Esc>', [[<C-\><C-n>]], mode = 't', desc = 'Exit terminal mode' },
    { '<C-h>', [[<Cmd>wincmd h<CR>]], mode = 't', desc = 'Terminal: move left' },
    { '<C-j>', [[<Cmd>wincmd j<CR>]], mode = 't', desc = 'Terminal: move down' },
    { '<C-k>', [[<Cmd>wincmd k<CR>]], mode = 't', desc = 'Terminal: move up' },
    { '<C-l>', [[<Cmd>wincmd l<CR>]], mode = 't', desc = 'Terminal: move right' },
  },
}
