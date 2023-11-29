-- search files, hidden ones
vim.keymap.set('n', '<leader>ff', ":lua require('telescope.builtin').find_files({no_ignore = true, hidden = true})<CR>", {})
vim.keymap.set('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<CR>", {})

