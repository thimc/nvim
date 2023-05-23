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

local opts = {noremap = true}
vim.keymap.set('n', '<leader>q', '<cmd>TroubleToggle document_diagnostics<CR>', opts)
vim.keymap.set('n', '<leader>qw', '<cmd>TroubleToggle workspace_diagnostics<CR>', opts)
