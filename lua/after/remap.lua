-- theme light
vim.keymap.set('n', '<leader>tl', function()
    -- for some reason we need to run this twice in order for it to work sometimes
    -- just do it twice all the time so that it always works
    vim.cmd.colorscheme 'catppuccin-latte'
    vim.cmd.colorscheme 'catppuccin-latte'
end, {desc = "enter light mode"})

-- theme dark
vim.keymap.set('n', '<leader>td', function() vim.cmd.colorscheme 'tokyonight-night' end, {desc = "enter dark mode"})
