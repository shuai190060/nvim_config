-- Setup nvim-lint for Puppet
require("lint").linters_by_ft = {
  puppet = { 'puppet-lint' },
}

-- Configure puppet-lint linter
require("lint").linters['puppet-lint'] = {
  cmd = 'puppet-lint',
  stdin = false,
  args = {},
  ignore_exitcode = true,
  parser = require('lint.parser').from_pattern(
    [[(%d+):(%d+): %a+:%s*(.*)]],
    { "lnum", "col", "message" },
    {
      source = 'puppet-lint',
      severity = vim.diagnostic.severity.ERROR,
    }
  ),
}

-- Autocmd to trigger linting on BufRead and BufWritePost for Puppet files (*.pp)
vim.api.nvim_create_autocmd({ "BufRead", "BufWritePost" }, {
  pattern = { "*.pp" },
  callback = function()
    require('lint').try_lint()
  end,
})

