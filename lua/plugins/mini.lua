  return {
    'echasnovski/mini.nvim',
    config = function()
      -- Around/Inside
      require('mini.ai').setup { n_lines = 500 }

      require('mini.comment').setup()

      -- Simple and easy statusline
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- https://github.com/echasnovski/mini.nvim
    end,
  }
