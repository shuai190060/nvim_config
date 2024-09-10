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

