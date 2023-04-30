local ok, builtin = pcall(require, 'telescope.builtin')
if ok then
	local bind = vim.keymap.set
	bind('n', '<leader>ff', builtin.find_files, {})
	bind('n', '<leader>fg', builtin.live_grep, {})
	bind('n', '<leader>fb', builtin.buffers, {})
	bind('n', '<leader>fh', builtin.help_tags, {})
end
