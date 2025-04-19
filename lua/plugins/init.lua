return {
	"tpope/vim-sleuth",
	"folke/which-key.nvim",
	"rcarriga/nvim-notify",
	{ 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
	require('plugins.autopair'),
	require('plugins.dressing'),
	require('plugins.git-signs'),
	require('plugins.jupynium'),
	require('plugins.love2d'),
	require('plugins.mini'),
	require('plugins.neotree'),
	require('plugins.telescope'),
	require('plugins.tokyonight'), -- colorscheme
	require('plugins.treesitter'),
	require('plugins.render-markdown'),
	require('plugins.vimtex'),

	-- The almighty LSP
	require('plugins.nvim-lspconfig')

}
