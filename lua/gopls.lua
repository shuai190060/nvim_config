-- Import the necessary modules
local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

-- Setup for gopls
lspconfig.gopls.setup {
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  root_dir = util.root_pattern("go.work", "go.mod",".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

-- Setup for terraformls
lspconfig.terraformls.setup {
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "tf" },
  root_dir = util.root_pattern(".terraform", ".git", "*.tf"),
}

-- for golang automatically beauty
-- Install and configure LSP for Go
local nvim_lsp = require('lspconfig')

nvim_lsp.gopls.setup({
  on_attach = function(client, bufnr)
    -- Enable format on save
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          vim.lsp.buf.format({ async = true })
        end,
      })
    end
  end,
})

-- null-ls setup for gofmt or goimports
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.gofmt,    -- or use goimports
    -- null_ls.builtins.formatting.goimports,
  },
})

-- Auto format Go files on save
vim.cmd [[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePre *.go lua vim.lsp.buf.format({ async = false })
  augroup END
]]

