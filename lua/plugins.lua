return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Mason for LSP management
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  }

  -- LSP configurations
  use 'neovim/nvim-lspconfig'

  -- Code Completion Suite
  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/vim-vsnip'
  }

  -- File Explorer Tree
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-tree/nvim-tree.lua'

  --
  -- use {
  --  'kyazdani42/nvim-tree.lua',
  --  requires = 'kyazdani42/nvim-web-devicons', -- optional, for file icons
  --}

  -- DAP for debugging
  use 'mfussenegger/nvim-dap'
  
  -- UI for DAP
  use { 
    'rcarriga/nvim-dap-ui',
    requires = 'mfussenegger/nvim-dap'
  }

  -- Dracula theme for styling
  use 'Mofiqul/dracula.nvim'

  -- Treesitter (recommended installation method)
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- Telescope used to fuzzy search files
  use {
    'nvim-telescope/telescope.nvim', -- tag = '0.1.0',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Lualine information / status bar
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Autopairs to generate brackets etc.
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup() end
  }

  -- Bufferline to show all open buffers
  use {
    'akinsho/bufferline.nvim', tag = 'v3.*',
    requires = 'nvim-tree/nvim-web-devicons'
  }

  -- LSP Saga (UI for LSP)
  use {
    'glepnir/lspsaga.nvim',
    branch = 'main',
    -- commit = 'd5bdb96c6447281a6f62d4a95fb192876f453d53',
  }

  -- Indent guides
  use {
    'lukas-reineke/indent-blankline.nvim', tag = 'v2.0.0',
  }

  -- Floaterm to run lazygit in a terminal
  use 'voldikss/vim-floaterm'

  -- Terraform syntax
  use 'hashivim/vim-terraform'

  -- Linting for multiple languages
  use 'mfussenegger/nvim-lint'
  -- for golang automatically beauty
  use {
  'jose-elias-alvarez/null-ls.nvim',
  requires = { 'nvim-lua/plenary.nvim' }
}

end)

