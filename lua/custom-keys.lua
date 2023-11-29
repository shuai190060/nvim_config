--fetch keymap function
--  change leader key 
vim.g.mapleader = ","

local map = vim.api.nvim_set_keymap

-- map the key n to run the command :NvimTreeToggle:
map('n','n', [[:NvimTreeToggle<CR>]], {})


-- ctl +s to save the file
map('n','<C-s>', [[:w<CR>]],{})


-- Nvim-dap key mappings
map('n','<F5>', [[:lua require'dap'.continue()<CR>]], {})

-- C+d debugmode and remove NvimTree 
map('n','<C-d>',[[:NvimTreeToggle<CR> :lua require'dapui'.toggle()<CR>]],{})
map('n','<F6>',[[:lua require'dap'.repl.open()<CR>]],{})

-- ctrl +b sets a breakpoint
map('n','<C-b>', [[:lua require'dap'.toggle_breakpoint()<CR>]],{})


-- press ctrl +l to set Logpoint
map('n', '<C-l>', [[:lua require'dap'.set_breakpoint(nil,nil,vim.fn.input('Log Point Msg:'))<CR>]],{})


-- press f10 to step over
map('n','<F10>',[[:lua require'dap'.step_over()<CR>]],{})
map('n','<F11>',[[:lua require'dap'.step_into()<CR>]],{})
map('n','<F12>',[[:lua require'dap'.step_out()<CR>]],{})
map('n','<F6>',[[:lua require'dap'.repl.open()<CR>]],{})
map('n','dl',[[:lua require'dap'.run_last()<CR>]],{})
