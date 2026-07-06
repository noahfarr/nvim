vim.pack.add({
  { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
}, { confirm = false })

require('catppuccin').setup {
  transparent_background = true,
}
vim.cmd.colorscheme 'catppuccin-macchiato'
vim.cmd.hi 'Comment gui=none'
