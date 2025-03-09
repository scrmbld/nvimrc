return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		-- The snippen engine
		{
			'L3MON4D3/LuaSnip',
			build = (function()
				-- make sure that we have the things we need for this build step
				-- necessary to enable regex support
				-- we might not have this if I haven't installed make yet or am trying to use Windows
				-- but otherwise it shouldn't matter much
				if vim.fn.has('win32') or vim.fn.executable 'make' == 0 then
					return
				end
				return 'make installjsregep'
			end)(),
			dependencies = {
				-- add snippets here
			}
		},
		-- make LuaSnip available to nvim-cmp
		'saadparwaiz1/cmp_luasnip',

		-- Add some more sources
		'hrsh7th/cmp-nvim-lsp', -- LSP
		'hrsh7th/cmp-path', -- filesystem paths
	},
	config = function()
		-- See `:help cmp`
		local cmp = require('cmp')
		local luasnip = require('luasnip')
		luasnip.config.setup {}

		cmp.setup {
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = { completeopt = 'menu,menuone,noinsert' },

			preselect = cmp.PreselectMode.None,

			-- For an understanding of why these mappings were
			-- chosen, you will need to read `:help ins-completion`
			--
			-- No, but seriously. Please read `:help ins-completion`, it is really good!
			mapping = cmp.mapping.preset.insert {
				['<C-n>'] = cmp.mapping.select_next_item(),
				['<C-p>'] = cmp.mapping.select_prev_item(),

				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),

				['<C-y>'] = cmp.mapping.confirm { select = true },

				['<C-Space>'] = cmp.mapping.complete {},

				['<C-l>'] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { 'i', 's' }),
				['<C-h>'] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { 'i', 's' }),

			},
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'path' },
			},
		}
	end,
}
