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
	local bind = vim.keymap.set
	local opts = {noremap=true, buffer=bufnr}

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
	bind('n', '<leader>Q', vim.diagnostic.setloclist, opts)

	-- Help
	bind('n', '<leader>k', vim.lsp.buf.hover, opts)
	bind({'n','i'}, '<C-k>', vim.lsp.buf.signature_help, opts)

	-- Workspace
	bind('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
	bind('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
	bind('n', '<leader>wl', ':LspWorkspaceList<CR>', opts)

	-- Show diagnostic message when hovering in NORMAL mode
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local fopts = {
				focusable = false,
				source = 'always',
				scope = 'cursor',
				prefix = ' ',
			}
			vim.diagnostic.open_float(nil, fopts)
		end,
	})
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
		['null-ls'] = {'go', 'c'}
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
