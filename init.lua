require('plugins')
require('file-explorer')
require('mason-config')
require('gopls')
require('code-completion')
require('custom-keys')
require('debugging')
--require('styling')
require('syntax-highlight')
require('file-finder')
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager

  use {
    'nvim-telescope/telescope.nvim', -- Telescope plugin
    requires = { {'nvim-lua/plenary.nvim'} } -- Dependency for Telescope
  }
end)

--require('telescope').setup {
  --extensions = {
    --fzf = {
      -- FZF configuration options go here
   -- },
 -- },
--}

-- To load the extension
--require('telescope').load_extension('fzf')

