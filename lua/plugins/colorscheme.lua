return {
  -- CATPPUCCIN
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha', -- "latte", "frappe", "macchiato", or "mocha"
      })
    end,
  },

  -- ROSE-PINE
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end,
  },

  -- Tokyo Night
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- Kanagawa
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
      statementStyle = { italic = false },
    },
  },
}
