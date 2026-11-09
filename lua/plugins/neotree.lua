return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    window = { position = 'left' },
    source_selector = { winbar = false },
    filesystem = {
      filtered_items = { visible = true },
      follow_current_file = { enabled = false },
    },
    default_component_configs = {
      git_status = {
        symbols = { added = 'A', modified = 'M', deleted = 'D', untracked = 'U', renamed = 'R' },
      },
    },
  },
}
