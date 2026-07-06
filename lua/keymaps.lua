vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('i', 'kj', '<Esc>')

vim.keymap.set({ 'n', 'x', 'o' }, '<C-n>', 'nzzzv', { silent = true, desc = 'Next search result' })
vim.keymap.set({ 'n', 'x', 'o' }, '<C-p>', 'Nzzzv', { silent = true, desc = 'Prev search result' })

vim.keymap.set('c', '<C-n>', function()
  local t = vim.fn.getcmdtype()
  return (t == '/' or t == '?') and '<C-g>' or '<C-n>'
end, { expr = true, desc = 'Next match during incsearch' })
vim.keymap.set('c', '<C-p>', function()
  local t = vim.fn.getcmdtype()
  return (t == '/' or t == '?') and '<C-t>' or '<C-p>'
end, { expr = true, desc = 'Prev match during incsearch' })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
