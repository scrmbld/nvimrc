return {
	"tpope/vim-sleuth",
	"folke/which-key.nvim",
	"rcarriga/nvim-notify",
	{ 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
	require('plugins.tokyonight'), -- colorscheme
	require('plugins.telescope'),
	require('plugins.git-signs'),
	require('plugins.mini'),
	require('plugins.treesitter'),
	require('plugins.autopair'),
	require('plugins.neotree'),
	require('plugins.render-markdown'),
	require('plugins.love2d'),
}
