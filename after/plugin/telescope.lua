local bind = vim.keymap.set
local opts = {noremap = true}
bind('n', '<leader>fb', require('telescope.builtin').buffers, opts)
bind('n', '<leader>ff', require('telescope.builtin').find_files, opts)
bind('n', '<leader>fg', require('telescope.builtin').live_grep, opts)
bind('n', '<leader>fh', require('telescope.builtin').help_tags, opts)
bind('n', '<leader>fr', require('telescope.builtin').oldfiles, opts)
