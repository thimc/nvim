-- local command = vim.api.nvim_create_user_command
-- command('LspWorkspaceAdd', function()
-- 	vim.lsp.buf.add_workspace_folder()
-- end, {desc = 'Add folder to workspace'})
-- command('LspWorkspaceList', function()
-- 	vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, {desc = 'List workspace folders'})
-- command('LspWorkspaceRemove', function()
-- 	vim.lsp.buf.remove_workspace_folder()
-- end, {desc = 'Remove folder from workspace'})
-- command('LspFormat', function()
-- 	vim.lsp.buf.format()
-- end, {desc = 'Format buffer with language server'})

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		local opts = {buffer = bufnr}

		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

		vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

		vim.keymap.set({'n','v'}, "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)

		-- Symbols
		vim.keymap.set('n', '<leader>ds', vim.lsp.buf.document_symbol, opts)
		vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)

		-- Diagnostics
		-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
		-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
		-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
		-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

		-- Help
		vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

		-- Workspace
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
	end,
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
	vim.lsp.handlers.hover, { max_width = 80, focusable = false })

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
	vim.lsp.handlers.signature_help, { focusable = false })

vim.cmd([[
" Show diagnostic message when hovering in NORMAL mode
autocmd CursorHold * silent! lua vim.diagnostic.open_float(nil, { focusable = false })

" Show signature help when hovering in INSERT mode
autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help({ focusable = false })
]])

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	severity_sort = true,
})

vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*.go',
	callback = function()
		vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
	end
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.clangd.setup {
	capabilities = capabilities
}

lspconfig.gopls.setup {
	capabilities = capabilities,
}

--local null_ls = require("null-ls")
--null_ls.setup({
----	on_attach = on_attach(client, 1),
--	sources = {
--		null_ls.builtins.code_actions.shellcheck,
--		null_ls.builtins.diagnostics.shellcheck,
--		null_ls.builtins.diagnostics.eslint,
--		null_ls.builtins.completion.spell,
--		null_ls.builtins.completion.tags,
--		null_ls.builtins.hover.dictionary,
--	},
--})
