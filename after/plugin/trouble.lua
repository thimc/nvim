-- settings without a patched font or icons
local opts = { silent=true, noremap=true }
local bind = vim.keymap.set

require("trouble").setup {
	icons = false,
	fold_open = "v",
	fold_closed = ">",
	indent_lines = false,
	signs = {
		error = "E",
		warning = "W",
		hint = "H",
		information = "I",
		other = "O"
	},
}

bind('n', '<leader>q', '<cmd>TroubleToggle document_diagnostics<CR>', opts)
bind('n', '<leader>qw', '<cmd>TroubleToggle workspace_diagnostics<CR>', opts)
bind('n', '<leader>qq', '<cmd>TroubleToggle quickfix<CR>', opts)

bind('n', 'qr', '<cmd>TroubleToggle lsp_references<CR>', opts)
bind('n', 'qd', '<cmd>TroubleToggle lsp_definitions<CR>', opts)
