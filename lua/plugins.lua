return require('packer').startup(function(user)
	-- this is the config
	use 'wbthomason/packer.nvim'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'

	-- Plugins for code completion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/vim-vsnip'

	-- Nvimtree for file exploring
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',

		}
	}


	-- DAP for debugging
	use 'mfussenegger/nvim-dap'

	-- DAP UI
	use {
		'rcarriga/nvim-dap-ui',
		requires = {
			'mfussenegger/nvim-dap'
		}
	}


	use 'Mofiqul/dracula.nvim'

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            		ts_update()
		end,
	}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}

--	use {
  --  'nvim-telescope/telescope-fzf-native.nvim', -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
    --run = 'make',
 -- }



end)
