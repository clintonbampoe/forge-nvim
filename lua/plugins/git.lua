return {
  -- Git signs in gutter
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      signs = {
        add = { text = '│' },
        change = { text = '│' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
    keys = {
      {
        ']c',
        function()
          require('gitsigns').next_hunk()
        end,
        desc = 'Next hunk',
      },
      {
        '[c',
        function()
          require('gitsigns').prev_hunk()
        end,
        desc = 'Prev hunk',
      },
      {
        '<leader>gp',
        function()
          require('gitsigns').preview_hunk()
        end,
        desc = 'Preview hunk',
      },
    },
  },

  -- LazyGit TUI
  {
    'kdheepak/lazygit.nvim',
    cmd = { 'LazyGit', 'LazyGitConfig', 'LazyGitCurrentFile', 'LazyGitFilter', 'LazyGitFilterCurrentFile' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
}
