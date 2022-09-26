-- Navigation between splits
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })
-- Adjusting splits size
vim.api.nvim_set_keymap("", "<S-h>", ":vertical resize +3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<S-j>", ":resize -3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<S-k>", ":resize +3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<S-l>", ":vertical resize -3<CR>", { noremap = true, silent = true })

-- Nvim-tree
vim.api.nvim_set_keymap("", "<C-t>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
