return {
  'rachartier/tiny-code-action.nvim',
  event = 'LspAttach',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('tiny-code-action').setup()
  end,
  keys = {
    {
      '<M-CR>',
      function()
        require('tiny-code-action').code_action()
      end,
      desc = 'Code action',
    },
  },
}
