-- completeopt is to manage code suggestion format
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert', 'preview'}
vim.opt.shortmess = vim.opt.shortmess + { c = true }
-- this will prevent the message from being to be very long
--


local cmp = require'cmp'

cmp.setup({
	-- Configurations
	-- sources are installed that can be used for code suggestions
	sources = {
		{name = 'path'	},
		{name = 'nvim_lsp', keyword_length = 3},
		{name = 'nvim_lsp_signature_help'},
		{name = 'nvim_lua', keyword_length = 2},
		{name = 'buffer', keyword_length = 2},
		{name = 'vsnip', keyword_length = 2},
	},
	-- formatting
	formatting = {
		fields = {'menu','abbr', 'kind'},
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = 'λ',
      				vsnip = '⋗',
      				buffer = 'Ω',
      				path = 'p',
			}
			item.menu = menu_icon[entry.source.name]
			return item 
		end,
	},

	-- windows for styling
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	-- mappings are keyboard shortcuts to execute commands
	mapping = {
		-- ctrl +space will bring up the code completion
		['<C-Space>'] = cmp.mapping.complete(),
		-- shift + tab go to previous suggest test
		['<Up>'] = cmp.mapping.select_prev_item(),
		-- tab to go to next item 
		['<Down>'] = cmp.mapping.select_next_item(),
		['<C-e>'] = cmp.mapping.close(),
		-- select the item by pressing enter 
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,

		}),
	},
})

