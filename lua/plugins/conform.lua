vim.pack.add({
  'https://github.com/stevearc/conform.nvim',
}, { confirm = false })

require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    local disable_filetypes = { c = true, cpp = true }
    local lsp_format_opt = disable_filetypes[vim.bo[bufnr].filetype] and 'never' or 'fallback'
    return { timeout_ms = 500, lsp_format = lsp_format_opt }
  end,
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'isort', 'black' },
  },
}

vim.keymap.set('n', '<leader>f', function()
  require('conform').format { async = true, lsp_format = 'fallback' }
end, { desc = '[F]ormat buffer' })
