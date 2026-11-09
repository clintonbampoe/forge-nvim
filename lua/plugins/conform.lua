return {
  'stevearc/conform.nvim',
  dependencies = { 'williamboman/mason.nvim' },
  event = 'BufWritePost',
  cmd = 'ConformInfo',
  opts = {
    formatters_by_ft = {
      c = { 'clang-format' },
      cpp = { 'clang-format' },
      cs = { 'csharpier' },
      dockerfile = { 'dockerfmt' },
      go = { 'goimports', 'gofumpt' },
      lua = { 'stylua' },
      yaml = { 'yamlfix' },
      xml = { 'prettier_xml' },
      sh = { 'shfmt' },
      bash = { 'shfmt' },
      json = { 'prettier' },
      html = { 'prettier' },
      css = { 'prettier' },
      javascript = { 'prettier' },
      javascriptreact = { 'prettier' },
      nginx = { 'nginxfmt' },
      typescript = { 'prettier' },
      typescriptreact = { 'prettier' },
    },
    format_after_save = {
      lsp_format = 'fallback',
    },
    formatters = {
      shfmt = { prepend_args = { '-i', '2', '-ci' } },
      prettier_xml = {
        command = 'prettier',
        args = {
          '--stdin-filepath',
          '$FILENAME',
          '--parser',
          'xml',
          '--xml-whitespace-sensitivity',
          'ignore',
        },
      },
      nginxfmt = {
        command = 'nginxfmt',
        args = { '-' },
      },
    },
  },
}
