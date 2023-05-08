local command = vim.api.nvim_create_user_command
command('LspWorkspaceAdd', function() vim.lsp.buf.add_workspace_folder() end, {desc = 'Add folder to workspace'})
command('LspWorkspaceList', function() vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, {desc = 'List workspace folders'})
command('LspWorkspaceRemove', function() vim.lsp.buf.remove_workspace_folder() end, {desc = 'Remove folder from workspace'})
command('LspWorkspaceList', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, {desc = 'Lists all folders for the workspace'})
command('LspFormat', function() vim.lsp.buf.format() end, {desc = 'Format buffer with language server'})

local lsp = require('lsp-zero').preset({
	float_border = 'none',
})

lsp.on_attach(function(client, bufnr)
	-- lsp.default_keymaps({buffer = bufnr})

	-- Format buffer on save
	lsp.buffer_autoformat()

	local bind = vim.keymap.set

	bind("n", "gr", vim.lsp.buf.references, opts)
	bind('n', 'gi', vim.lsp.buf.implementation, opts)
	bind('n', 'gd', vim.lsp.buf.definition, opts)
	bind('n', 'gD', vim.lsp.buf.declaration, opts)

	bind('n', '<leader>D', vim.lsp.buf.type_definition, opts)
	bind('n', '<leader>rn', vim.lsp.buf.rename, opts)

	bind({'n','v'}, "<leader>ca", vim.lsp.buf.code_action, opts)
	bind('n', '<leader>f', vim.lsp.buf.format, opts)

	-- Symbols
	bind('n', '<leader>ds', vim.lsp.buf.document_symbol, opts)
	bind('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)

	-- Diagnostics
	bind('n', '<leader>e', vim.diagnostic.open_float, opts)
	bind('n', '[d', vim.diagnostic.goto_prev, opts)
	bind('n', ']d', vim.diagnostic.goto_next, opts)
	-- bind('n', '<leader>q', vim.diagnostic.setloclist, opts)

	-- Help
	bind('n', '<leader>k', vim.lsp.buf.hover, opts)
	bind({'n','i'}, '<C-k>', vim.lsp.buf.signature_help, opts)

	-- Workspace
	bind('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
	bind('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
	bind('n', '<space>wl', ':LspWorkspaceList<CR>', opts)
end)

-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.set_sign_icons({
	error = 'E',
	warn = 'W',
	hint = 'H',
	info = 'I'
})

lsp.setup()

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	severity_sort = true,
})

vim.cmd([[
" Show diagnostic message when hovering in NORMAL mode
autocmd CursorHold * silent! lua vim.diagnostic.open_float(nil, { focusable = false })

" Show signature help when hovering in INSERT mode
autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help({ focusable = false })
]])

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


