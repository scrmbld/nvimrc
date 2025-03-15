return {
	'neovim/nvim-lspconfig',
	dependencies = {
		-- Automatically install LSPs and related tools to stdpath for Neovim
		-- Mason must be loaded before its dependents so we need to set it up here.
		-- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
		{ 'williamboman/mason.nvim', opts = {} },
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',

		-- Useful status updates for LSP.
		-- Allows extra capabilities provided by nvim-cmp
		'hrsh7th/cmp-nvim-lsp',
	},
	config = function()
		-- LSP attach stuff
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('scrmbld-lsp-attach', { clear = true }),
			callback = function(event)
				-- create some keybinds
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover Documentation" })
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
				vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "[G]oto [R]eferences" })
				vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename" })

				vim.keymap.set('n', '<leader>T', require('telescope.builtin').lsp_type_definitions,
					{ desc = "Goto type definition" })

				-- make symbols light up when we hover over them
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
					local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
					vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})
				end

				vim.api.nvim_create_autocmd('LspDetach', {
					group = vim.api.nvim_create_augroup('scrmbld-lsp-detach', { clear = true }),
					callback = function(event2)
						vim.lsp.buf.clear_references()
						vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
					end,
				})
			end
		})


		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

		local servers = {
			ts_ls = {},
			gopls = {},
			pyright = {},
			clangd = {},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = 'Replace',
						},
						-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
						-- diagnostics = { disable = { 'missing-fields' } },
					},
				},
			},
		}

		require('mason').setup()

		-- automagically install of the language servers we added configs for earlier
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			'stylua', -- also automatically install sylua
		})
		require('mason-tool-installer').setup { ensure_installed = ensure_installed }

		require('mason-lspconfig').setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
					require('lspconfig')[server_name].setup(server)
				end
			}
		})
	end,
}
