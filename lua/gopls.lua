-- require lsp configuration from the plugin so i can attach gopls to it
lspconfig=require "lspconfig"
util = require "lspconfig/util"

lspconfig.gopls.setup {
	cmd = { "gopls", "serve" },
	filetypes = {"go", "gomod"},
	root_dir=util.root_pattern{"go.work","go.mod", ".git"},
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,

			},
			staticcheck = true,
		},
	},
}



