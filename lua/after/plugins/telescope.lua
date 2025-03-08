local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Seach files' })
vim.keymap.set('n', '<leader>ss', builtin.git_files, { desc = 'Search git files'})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Seach by grep' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search plugin help pages' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to Telescope to change the theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = 'Fuzzily search in current buffer' })
