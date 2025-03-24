-- non plugin specific keymaps

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- navigate quickfix lists
vim.keymap.set('n', 'Qj', '<cmd>cnext<CR>zz')
vim.keymap.set('n', 'Qk', '<cmd>cprev<CR>zz')

-- open netrw
vim.keymap.set('n', '<leader>fe', vim.cmd.Ex)

-- disable search highlight with escape
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- paste over text while preseving "0
vim.keymap.set('n', '<leader>dp', '\"_dP')

-- yank & paste system clipboard
vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('n', '<leader>Y', '\"+Y')
vim.keymap.set('n', '<leader>p', '\"+p')
vim.keymap.set('v', '<leader>p', '\"+p')
vim.keymap.set('n', '<leader>P', '\"+P')

-- delete into void
vim.keymap.set('n', '<leader>dv', '\"_d')
vim.keymap.set('v', '<leader>dv', '\"_d')
vim.keymap.set('n', '<leader>Dv', '\"_D')

-- pull text around in visual mode
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

-- navigate splits more conveniently
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- fzf a direcory to open a new tmux window there
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- open diagnostic in floating buffer
vim.keymap.set('n', '<leader>df', '<cmd> lua vim.diagnostic.open_float() <CR>', { desc = 'Open floating diagnostic' })

-- make the current file executable
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

-- add double spaces before all newlines in markdown files
-- <leader>mf
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = { '*.markdown', '*.mdown', '*.mkd', '*.mkdn', '*.mdwn', '*.md' },
  callback = function()
    vim.schedule(function()
      vim.keymap.set('n', '<leader>mf', function()
        -- match strings that begin at ^ and end with newline
        -- match strings that contain at least one non-space character
        -- match strings that do not end with two spaces
        -- replace with the matched string from ^ to the last non-space character, followed by two spaced and \r
        vim.cmd 'silent %s/\\v^(\\s*.*[^ ]+)([ ]{0,1})\\n/\\1  \r/e'
      end)
    end)
  end,
})
