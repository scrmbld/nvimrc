return {
	'stevearc/conform.nvim',
	event = { 'BufWritePre' },
	cmd = { 'ConformInto' },

	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			-- disable for languages that don't have real style standards
			local disable_filetypes = { c = true, cpp = true }
			local lsp_format_opt
			if disable_filetypes[vim.bo[bufnr].filetype] then
				lsp_format_opt = 'never'
			else
				lsp_format_opt = 'fallback'
			end
			return {
				timeout_ms = 500,
				lsp_format = lsp_format_opt
			}
		end,
		formatters_by_ft = {
			-- add formatters by filetype
			-- TODO
		}
	}
}
