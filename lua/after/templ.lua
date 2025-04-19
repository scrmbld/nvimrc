-- automatically run templ generate on save
vim.api.nvim_create_autocmd('BufWritePost', {
	pattern = { '*.templ' },
	command = "!templ generate"
})
