-- Includes all autocommands that exist for purposes other than creating keymaps

-- jump to previous edit position on file open
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = { '*' },
  callback = function()
    local line = vim.fn.line '\'"'
    if
        line >= 1
        and line <= vim.fn.line '$'
        and vim.bo.filetype ~= 'commit'
        and vim.fn.index({ 'xxd', 'gitrebase' }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- don't insert comment characters on line wrap, insert mode enter, or normal mode o
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*' },
  callback = function()
    vim.cmd('set formatoptions-=cro')
    vim.cmd('setlocal formatoptions-=cro')
  end
})
