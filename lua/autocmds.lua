vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Show a start screen on an empty, unnamed buffer',
  callback = function()
    if vim.fn.argc() > 0 or vim.fn.line2byte '$' ~= -1 or vim.fn.bufname() ~= '' then
      return
    end

    local header = {
      '██╗   ██╗██╗███╗   ███╗',
      '██║   ██║██║████╗ ████║',
      '██║   ██║██║██╔████╔██║',
      '╚██╗ ██╔╝██║██║╚██╔╝██║',
      ' ╚████╔╝ ██║██║ ╚═╝ ██║',
      '  ╚═══╝  ╚═╝╚═╝     ╚═╝',
      '',
      'f  find files    g  live grep    c  toggle claude',
    }

    local width = vim.api.nvim_win_get_width(0)
    local content = {}
    for _, line in ipairs(header) do
      if line == '' then
        table.insert(content, '')
      else
        local pad = math.max(0, math.floor((width - vim.fn.strdisplaywidth(line)) / 2))
        table.insert(content, string.rep(' ', pad) .. line)
      end
    end

    local height = vim.api.nvim_win_get_height(0)
    local top_pad = math.max(0, math.floor((height - #content) / 2) - 2)
    for _ = 1, top_pad do
      table.insert(content, 1, '')
    end

    local buf = vim.api.nvim_get_current_buf()
    vim.bo[buf].modifiable = true
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
    vim.bo[buf].modifiable = false
    vim.bo[buf].modified = false
    vim.bo[buf].buftype = 'nofile'
    vim.bo[buf].bufhidden = 'wipe'
    vim.bo[buf].swapfile = false
    vim.bo[buf].filetype = 'dashboard'
  end,
})
