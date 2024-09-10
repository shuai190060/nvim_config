require("nvim-autopairs").setup{}
local M = {}

function M.setup()
    vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true, silent = true })
end

return M

