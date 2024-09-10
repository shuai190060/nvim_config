-- completeopt is to manage code suggestion format
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert', 'preview'}
vim.opt.shortmess:append("c")
-- This will prevent the message from being too long

local cmp = require'cmp'

cmp.setup({
  -- Required by vsnip
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  -- Configurations
  -- sources are installed that can be used for code suggestions
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp', keyword_length = 3 },
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lua', keyword_length = 2 },
    { name = 'buffer', keyword_length = 2 },
    { name = 'vsnip', keyword_length = 2 },
  },

  -- formatting
  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        vsnip = '⋗',
        buffer = 'b',
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
    -- Shift+TAB to go to the Previous Suggested item
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    
    -- Tab to go to the next suggestion
    ['<Tab>'] = cmp.mapping.select_next_item(),
    
    -- CTRL+SHIFT+f to scroll backwards in the documentation
    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
    
    -- CTRL+F to scroll forwards in the documentation
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    
    -- CTRL+SPACE to bring up completion at the current cursor location
    ['<C-Space>'] = cmp.mapping.complete(),
    
    -- CTRL+e to exit suggestion and close it
    ['<C-e>'] = cmp.mapping.close(),
    
    -- CR (Enter) to confirm the currently selected suggestion
    -- We set the ConfirmBehavior to insert the selected suggestion
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },
})

