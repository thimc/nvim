local bind = vim.keymap.set
bind('n', '<leader>gd', "<cmd>Git diff<CR>")
bind('n', '<leader>gl', "<cmd>Git log<CR>")
bind('n', '<leader>gs', "<cmd>Git status<CR>")
bind('n', '<leader>gg', ":Git ")
