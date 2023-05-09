local bind = vim.keymap.set
local opts = {noremap = true}
local builtin = require('telescope.builtin')
bind('n', '<leader>ff', builtin.find_files, opts)
bind('n', '<leader>fg', builtin.live_grep, opts)
bind('n', '<leader>fb', builtin.buffers, opts)
bind('n', '<leader>fh', builtin.help_tags, opts)
