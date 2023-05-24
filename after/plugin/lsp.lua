local lsp = require("lsp-zero").preset({})

if vim.loop.os_uname().sysname == "Linux" then
	lsp.ensure_installed({
		"clangd",
		"gopls",
		"lua-language-server",
	})
	require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
end

lsp.setup_servers({'clangd'})

lsp.on_attach(function(client, bufnr)
	local opts = {noremap=true, buffer=bufnr}
	lsp.default_keymaps(opts)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set({'n','i'}, '<C-k>', vim.lsp.buf.signature_help, opts)
end)

lsp.set_sign_icons({
	error = 'E',
	warn = 'W',
	hint = 'H',
	info = 'I'
})

lsp.setup()

vim.diagnostic.config({
	signs = true,
	virtual_text = false,
	underline = false,
	severity_sort = true,
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
		{name = 'nvim_lsp'},
		{name = 'buffer', keyword_length = 3},
		{name = 'luasnip', keyword_length = 2},
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		['<CR>'] = cmp.mapping.confirm({select = false}),
		['<C-Space>'] = cmp.mapping.complete(),
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
