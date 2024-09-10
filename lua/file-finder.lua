local builtin = require('telescope.builtin')

-- Keymap for Telescope live grep
vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})


-- Keymap for Telescope live grep
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})

-- Keymap for Telescope buffers
vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})

-- Keymap for Telescope help tags
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})

