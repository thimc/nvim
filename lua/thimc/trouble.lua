-- settings without a patched font or icons
local ok, trouble = pcall(require, 'trouble')

if ok then
	trouble.setup {
		icons = false,
		fold_open = "v", -- icon used for open folds
		fold_closed = ">", -- icon used for closed folds
		indent_lines = false, -- add an indent guide below the fold icons
		signs = {
			-- icons / text used for a diagnostic
			error = "E",
			warning = "W",
			hint = "H",
			information = "I",
			other = "O"
		},
		-- enabling this will use the signs defined in your lsp client
		diagnostic_signs = false
	}
	local opts = {silent=true, noremap=true}
	vim.keymap.set('n', '<leader>q',
		'<cmd>TroubleToggle document_diagnostics<CR>', opts)

	vim.keymap.set('n', '<leader>qw',
		'<cmd>TroubleToggle workspace_diagnostics<CR>', opts)

	vim.keymap.set('n', '<leader>qq',
		'<cmd>TroubleToggle quickfix<CR>', opts)

	vim.keymap.set('n', 'qr',
		'<cmd>TroubleToggle lsp_references<CR>', opts)

	vim.keymap.set('n', 'qd',
		'<cmd>TroubleToggle lsp_definitions<CR>', opts)
end
