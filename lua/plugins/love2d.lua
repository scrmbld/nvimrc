-- make the LSP work with love2d
-- and also add some binds to run love programs
-- https://github.com/S1M0N38/love2d.nvim
return {
  'S1M0N38/love2d.nvim',
  cmd = 'LoveRun',
  opts = {},
  keys = {
    { '<leader>v', ft = 'lua', desc = 'LÖVE' },
    { '<leader>vv', '<cmd>LoveRun<cr>', ft = 'lua', desc = 'Run LÖVE' },
    { '<leader>vs', '<cmd>LoveStop<cr>', ft = 'lua', desc = 'Stop LÖVE' },
  },
}
