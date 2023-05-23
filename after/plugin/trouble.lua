local bind = vim.keymap.set
local opts = {noremap = true}

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
