local luasnip = require('luasnip')
luasnip.config.set_config({
	region_check_events = 'InsertEnter',
	delete_check_events = 'InsertLeave'
})

require('luasnip.loaders.from_vscode').lazy_load()
local cmp = require('cmp')
local select_opts = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'path' },
		{ name = 'buffer' },
		{ name = 'nvim_lua' },
	},
	window = {
		documentation = vim.tbl_deep_extend(
			'force',
			cmp.config.window.bordered(),
			{
				max_height = 15,
				max_width = 60,
			}
		)
	},
	formatting = {
		fields = {'abbr', 'menu', 'kind'},
		format = function(entry, item)
			local short_name = {
				nvim_lsp = 'LSP',
				nvim_lua = 'nvim'
			}

			local menu_name = short_name[entry.source.name] or entry.source.name

			item.menu = string.format('[%s]', menu_name)
			return item
		end,
	},
	mapping = {
		-- confirm selection
		['<CR>'] = cmp.mapping.confirm({select = false}),
		['<C-l>'] = cmp.mapping.confirm({select = false}),

		-- navigate items on the list
		['<Down>'] = cmp.mapping.select_next_item(select_opts),
		['<Up>'] = cmp.mapping.select_prev_item(select_opts),
		['<C-n>'] = cmp.mapping.select_next_item(select_opts),
		['<C-p>'] = cmp.mapping.select_prev_item(select_opts),

		-- scroll up and down in the completion documentation
		['<C-u>'] = cmp.mapping.scroll_docs(-5),
		['<C-d>'] = cmp.mapping.scroll_docs(5),

		-- toggle completion
		['<C-SPACE>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.abort()
				fallback()
			else
				cmp.complete()
			end
		end),

		-- go to next placeholder in the snippet
		['<C-f>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, {'i', 's'}),

		-- go to previous placeholder in the snippet
		['<C-b>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {'i', 's'}),
	},
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})
