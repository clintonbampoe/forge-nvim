-- lua/plugins/go.lua
return {
  dir = vim.fn.stdpath('config'),
  name = 'go-commands',
  ft = 'go',
  config = function()
    local function format_with(formatters)
      vim.cmd('update')
      require('conform').format({ formatters = formatters, bufnr = 0 })
    end

    vim.api.nvim_create_user_command('GoFmt', function()
      format_with({ 'gofumpt' })
    end, { desc = 'Format current buffer with gofumpt' })

    vim.api.nvim_create_user_command('GoImports', function()
      format_with({ 'goimports' })
    end, { desc = 'Fix imports with goimports' })

    local function go_module_root()
      local file = vim.api.nvim_buf_get_name(0)
      local found = vim.fs.find('go.mod', { upward = true, path = vim.fn.fnamemodify(file, ':h') })[1]
      if found then
        return vim.fs.dirname(found)
      end
      return vim.fn.getcwd()
    end

    local function run_to_quickfix(cmd, title)
      local cwd = go_module_root()
      vim.system(cmd, { cwd = cwd, text = true }, function(result)
        vim.schedule(function()
          local output = (result.stdout or '') .. (result.stderr or '')
          local lines = vim.split(output, '\n', { trimempty = true })

          vim.fn.setqflist({}, ' ', {
            title = title,
            lines = lines,
            efm = '%f:%l:%c: %m,%f:%l: %m',
          })

          if #vim.fn.getqflist() > 0 then
            vim.cmd('copen')
          else
            vim.notify(title .. ': no issues found', vim.log.levels.INFO)
          end
        end)
      end)
    end

    vim.api.nvim_create_user_command('GoLint', function()
      run_to_quickfix({ 'golangci-lint', 'run', './...' }, 'GoLint')
    end, { desc = 'Run golangci-lint' })

    vim.api.nvim_create_user_command('GoVet', function()
      run_to_quickfix({ 'go', 'vet', './...' }, 'GoVet')
    end, { desc = 'Run go vet' })

    -- GoRun: execute the current package in a terminal split
    local function go_package_dir()
      return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':h')
    end

    vim.api.nvim_create_user_command('GoRun', function()
      vim.cmd('update')
      local dir = go_package_dir()
      vim.cmd('belowright split')
      vim.cmd('terminal')
      vim.fn.chansend(vim.b.terminal_job_id, 'cd ' .. vim.fn.shellescape(dir) .. ' && go run . \r')
      vim.cmd('startinsert')
    end, { desc = 'Run the current Go package' })
  end,
}
