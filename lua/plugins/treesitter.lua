return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	main = 'nvim-treesitter.configs',

	opts = {
		ensure_installed = { 'bash', 'python', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'latex' },
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { 'latex' },
		},
		indent = { enable = true },
	},
}
