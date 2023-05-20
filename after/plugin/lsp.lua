local lsp = require('lsp-zero').preset({
	float_border = 'none',
})

lsp.on_attach(function(client, bufnr)
	local bind = vim.keymap.set
	local opts = {noremap=true, buffer=bufnr}

	bind("n", "gr", vim.lsp.buf.references, opts)
	bind('n', 'gi', vim.lsp.buf.implementation, opts)
	bind('n', 'gd', vim.lsp.buf.definition, opts)
	bind('n', 'gD', vim.lsp.buf.declaration, opts)
	bind('n', '<leader>d', vim.lsp.buf.type_definition, opts)
	bind('n', '<leader>rn', vim.lsp.buf.rename, opts)
	bind({'n','v'}, "<leader>ca", vim.lsp.buf.code_action, opts)
	bind('n', '<leader>f', vim.lsp.buf.format, opts)

	-- Diagnostics
	bind('n', '<leader>e', vim.diagnostic.open_float, opts)
	bind('n', '[d', vim.diagnostic.goto_prev, opts)
	bind('n', ']d', vim.diagnostic.goto_next, opts)
	bind('n', '<leader>Q', vim.diagnostic.setloclist, opts)

	-- Help
	bind('n', '<leader>k', vim.lsp.buf.hover, opts)
	bind({'n','i'}, '<C-k>', vim.lsp.buf.signature_help, opts)
end)

lsp.set_sign_icons({
	error = 'E',
	warn = 'W',
	hint = 'H',
	info = 'I'
})

lsp.setup()

vim.diagnostic.config({
	virtual_text = false,
	severity_sort = true,
	underline = true,
	signs = true,
})

lsp.format_on_save({
	format_opts = {
		timeout_ms = 10000,
	},
	servers = {
		['null-ls'] = {'go'}
	},
})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.goimports_reviser,
		null_ls.builtins.formatting.golines,
		null_ls.builtins.code_actions.shellcheck,
		null_ls.builtins.completion.luasnip,
	},
})

-- Make sure you setup `cmp` after lsp-zero

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
	sources = {
		{name = 'path'},
		{name = 'luasnip'},
		{name = 'nvim_lsp'},
		{name = 'buffer'},
	},
	mapping = {
		-- `Enter` and `Ctrl-L' to confirm completion
		['<CR>'] = cmp.mapping.confirm({select = false}),
		['<C-l>'] = cmp.mapping.confirm({select = false}),

		-- Ctrl+Space to trigger completion menu
		['<C-Space>'] = cmp.mapping.complete(),

		-- Navigate between snippet placeholder
		['<C-f>'] = cmp_action.luasnip_jump_forward(),
		['<C-b>'] = cmp_action.luasnip_jump_backward(),
	}
})

cmp.setup.cmdline({'/', '?'}, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { {name = 'buffer'} }
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{name = 'path'}
	}, {
		{name = 'cmdline'}
	})
})
