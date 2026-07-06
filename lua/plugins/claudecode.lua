vim.pack.add({
  'https://github.com/coder/claudecode.nvim',
}, { confirm = false })

require('claudecode').setup {
  terminal = {
    provider = 'native',
  },
}

vim.keymap.set('n', '<leader>cc', '<cmd>ClaudeCode<cr>', { desc = 'Toggle Claude' })
vim.keymap.set('n', '<leader>cf', '<cmd>ClaudeCodeFocus<cr>', { desc = 'Focus Claude' })
vim.keymap.set('v', '<leader>cs', '<cmd>ClaudeCodeSend<cr>', { desc = 'Send selection to Claude' })
