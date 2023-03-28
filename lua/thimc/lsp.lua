local command = vim.api.nvim_create_user_command
command('LspWorkspaceAdd', function()
	vim.lsp.buf.add_workspace_folder()
end, {desc = 'Add folder to workspace'})

command('LspWorkspaceList', function()
	vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, {desc = 'List workspace folders'})

command('LspWorkspaceRemove', function()
	vim.lsp.buf.remove_workspace_folder()
end, {desc = 'Remove folder from workspace'})

-- Rebind some of the default keybindings
local on_attach = function(client, bufnr)
	local opts = {buffer = bufnr}
	local bind = vim.keymap.set
	local buf_command = vim.api.nvim_buf_create_user_command
	buf_command(bufnr, 'LspFormat', function()
		vim.lsp.buf.format()
	end, {desc = 'Format buffer with language server'})

	bind("n", "<leader>f", vim.lsp.buf.format, opts)
	bind("n", "<leader>D", vim.diagnostic.open_float, opts)
	bind("n", "<leader>ds", vim.lsp.buf.document_symbol, opts)
	bind("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
	bind("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	bind("n", "<leader>gr", vim.lsp.buf.references, opts)
	bind("n", "<leader>gd", vim.lsp.buf.definition, opts)
	bind("n", "<leader>gdt", vim.lsp.buf.type_definition, opts)
	bind("n", "<leader>gD", vim.lsp.buf.declaration, opts)
	bind("n", "<leader>gi", vim.lsp.buf.implementation, opts)
	bind("n", "<leader>k", vim.lsp.buf.hover, opts)
	bind("n", "<leader>rn", vim.lsp.buf.rename, opts)

	bind("i", "<C-h>", '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)

	bind('v', '<leader>F', vim.lsp.formatexpr, opts)
	print(bufnr)
end


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

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['clangd'].setup {
	on_attach = on_attach,
	capabilities = capabilities
}
require('lspconfig')['gopls'].setup {
	on_attach = on_attach,
	capabilities = capabilities,
	-- settings = {
	-- 	gopls = {
	-- 		experimentalPostfixCompletions = true,
	-- 		analyses = {
	-- 			unusedparams = true,
	-- 			shadow = true,
	-- 		},
	-- 		staticcheck = true,
	-- 	},
	-- },
	-- init_options = {
	-- 	usePlaceholders = true,
	-- },
}

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
