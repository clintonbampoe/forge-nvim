return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live grep' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find buffers' },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help tags' },
  },
  opts = {
    defaults = {
      layout_strategy = 'horizontal',
      layout_config = { prompt_position = 'top' },
      initial_mode = 'insert',
      sorting_strategy = 'ascending',
      winblend = 0,
    },
  },
}
