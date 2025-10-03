-- add Oz filetype
vim.filetype.add({
  extension = {
    oz = 'oz'
  }
})

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false

vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 0

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

vim.opt.signcolumn = "yes"

-- write swap files to disk more faster than normal
vim.opt.updatetime = 250

-- make sequences time out faster
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

-- display whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- :s previews and other similar stuff
vim.opt.inccommand = 'split'

vim.opt.cursorline = true
vim.opt.guicursor = "n-v-i-c:block-Cursor"

vim.opt.scrolloff = 6

vim.opt.undodir = vim.fn.stdpath("data") .. '/undodir'
vim.opt.undofile = true
