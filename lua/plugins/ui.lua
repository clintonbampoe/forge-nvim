return {
  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '\u{e0b4}', right = '\u{e0b6}' },
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = { 'filetype' },
        lualine_z = { 'progress' },
      },
    },
  },

  -- Indent guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = { char = '┆' },
    },
  },

  -- Column guides at colorcolumn
  {
    'xiyaowong/virtcolumn.nvim',
    init = function()
      vim.g.virtcolumn_char = '┊'
    end,
  },
}
