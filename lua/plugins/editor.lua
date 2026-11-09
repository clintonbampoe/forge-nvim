return {
  -- Auto close brackets/parens/quotes
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },

  -- Auto save on leave/focus lost
  {
    'okuuva/auto-save.nvim',
    event = { 'InsertLeave', 'TextChanged' },
    opts = {
      enabled = true,
      trigger_events = {
        immediate_save = { 'BufLeave', 'FocusLost' },
        defer_save = {},
        cancel_deferred_save = {},
      },
      debounce_delay = 0,
      condition = function(buf)
        return vim.bo[buf].modifiable
      end,
    },
  },

  -- Better % matching for brackets, keywords, etc.
  {
    'andymass/vim-matchup',
    event = 'VeryLazy',
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    end,
  },

  -- Syntax tree / highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    config = function()
      require('nvim-treesitter').install({
        'bash',
        'c',
        'cmake',
        'cpp',
        'c_sharp',
        'css',
        'html',
        'javascript',
        'typescript',
        'go',
        'json',
        'lua',
        'make',
        'markdown',
        'typescript',
        'vim',
        'xml',
      }, { max_jobs = 8 })

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
          if lang then
            pcall(vim.treesitter.start, args.buf, lang)
          end
        end,
      })
    end,
  },

  -- Code Folding
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    event = 'BufReadPost',
    init = function()
      vim.o.foldcolumn = '0'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldclose:,foldsep: ,foldinner: '

      -- Statuscolumn: fold indicator only on current line
      vim.o.statuscolumn = table.concat({
        '%s', -- signs
        '%#FoldColumn#',
        '%{v:lnum==line(".")?(foldlevel(v:lnum)>foldlevel(v:lnum-1)?"":foldclosed(v:lnum)!=-1?"":""):""}',
        ' %l ', -- line number
      }, '')
    end,
    config = function()
      require('ufo').setup({
        provider_selector = function()
          return { 'treesitter', 'indent' }
        end,
      })
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    end,
  },
}
