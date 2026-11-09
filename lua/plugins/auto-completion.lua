return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    {
      'L3MON4D3/LuaSnip',
      dependencies = { 'rafamadriz/friendly-snippets' },
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    cmp.setup({
      performance = {
        debounce = 60,
        throttle = 30,
        fetching_timeout = 200,
      },
      completion = {
        autocomplete = { cmp.TriggerEvent.TextChanged },
        completeopt = 'menu,menuone',
      },
      preselect = cmp.PreselectMode.Item,
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<Esc>'] = cmp.mapping.abort(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp', max_item_count = 5 },
        { name = 'luasnip', max_item_count = 3 },
      }, {
        { name = 'buffer', max_item_count = 3 },
        { name = 'path' },
      }),
    })
  end,
}
