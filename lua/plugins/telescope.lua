return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	event = 'VimEnter',
	dependencies = { 'nvim-lua/plenary.nvim' },

	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_dropdown()
		}
	}

}
