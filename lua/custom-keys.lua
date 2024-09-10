-- Fetch keymap
local map = vim.api.nvim_set_keymap

-- Leave insert mode with 'jk'
map('i', 'jk', '', {})

-- Map the key 'n' to run the command NvimTreeToggle
map('n', 'n', [[:NvimTreeToggle<CR>]], {})

-- Update leader key to ","
vim.g.mapleader = ","

-- Open Git terminal (using lazygit)
map('n', '<Leader>g', [[:FloatermNew lazygit<CR>]], {})

-- nvim-dap keymappings
-- Press F5 to start debugging
map('n', '<F5>', [[:lua require'dap'.continue()<CR>]], {})

-- Toggle breakpoint (mapped to Ctrl + b)
map('n', '<C-b>', [[:lua require'dap'.toggle_breakpoint()<CR>]], {})

-- Toggle breakpoint with condition (mapped to Ctrl + c)
map('n', '<C-c>', [[:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>]], {})

-- Toggle logpoint (mapped to Ctrl + l)
map('n', '<C-l>', [[:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log Point Msg: '))<CR>]], {})

-- Step over (mapped to F10)
map('n', '<F10>', [[:lua require'dap'.step_over()<CR>]], {})

-- Step into (mapped to F11)
map('n', '<F11>', [[:lua require'dap'.step_into()<CR>]], {})

-- Step out (mapped to F12)
map('n', '<F12>', [[:lua require'dap'.step_out()<CR>]], {})

-- Open REPL (mapped to F6)
map('n', '<F6>', [[:lua require'dap'.repl.open()<CR>]], {})

-- Run the last debugging configuration (mapped to 'dl')
map('n', 'dl', [[:lua require'dap'.run_last()<CR>]], {})

-- Toggle debug mode and NvimTree (mapped to Ctrl + d)
map('n', '<C-d>', [[:NvimTreeToggle<CR>:lua require'dap'.toggle()<CR>]], {})

