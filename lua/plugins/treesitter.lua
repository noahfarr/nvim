vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
}, { confirm = false })

require('nvim-treesitter').setup {
  install_dir = vim.fn.stdpath 'data' .. '/site',
}

local ensure_installed = {
  'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline',
  'python', 'query', 'vim', 'vimdoc',
}
require('nvim-treesitter').install(ensure_installed)

vim.api.nvim_create_autocmd('FileType', {
  pattern = ensure_installed,
  callback = function(args)
    vim.treesitter.start()
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
